#
#  PreferenceController.rb
#  Raffle
#
#  Created by phuesler on 13.05.10.
#  Copyright (c) 2010 huesler informatik. All rights reserved.
#

class PreferenceController  < NSWindowController
  BackgroundColorKey = 'backgroundColor'
  TextColorKey = 'textColor'
  BackgroundColorChangedNotification = 'BackgroundColorChangedNotification'
  TextColorChangedNotification = 'TextColorChangedNotification'
  
  attr_accessor :backgroundColorWell, :textColorWell
  
  def init
    if(!super.initWithWindowNibName("Preferences"))
      return nil
    else
      return self
    end
  end
  
  def windowDidLoad
    textColorWell.setColor(textColor)
    backgroundColorWell.setColor(backgroundColor)
  end
  
  def textColor
    unarchiveColorForKey(TextColorKey) || NSColor.whiteColor
  end
  
  def backgroundColor
    unarchiveColorForKey(BackgroundColorKey) || NSColor.blackColor
  end
  
  def changeBackgroundColor(sender)
    archiveColor(backgroundColorWell.color, BackgroundColorKey)
    postNotification(BackgroundColorChangedNotification)
  end
  
  def changeTextColor(sender)
    archiveColor(textColorWell.color, TextColorKey)
    postNotification(TextColorChangedNotification)
  end
  
  private
  
  def unarchiveColorForKey(key)
    NSUnarchiver.unarchiveObjectWithData(
        NSUserDefaults.standardUserDefaults.dataForKey(key)
      )
  end
  
  def archiveColor(color,key)
    NSUserDefaults.standardUserDefaults.setObject(
        NSArchiver.archivedDataWithRootObject(color),
        forKey: key
      )    
  end
  
  def postNotification(key)
    NSNotificationCenter.defaultCenter.postNotificationName(
                                        key,
                                        object: self)
  end
end
