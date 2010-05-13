#
#  PreferenceController.rb
#  Raffle
#
#  Created by phuesler on 13.05.10.
#  Copyright (c) 2010 huesler informatik. All rights reserved.
#

class PreferenceController  < NSWindowController
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
    unarchiveColorForKey("textColor") || NSColor.whiteColor
  end
  
  def backgroundColor
    unarchiveColorForKey("backgroundColor") || NSColor.blackColor
  end
  
  def changeBackgroundColor(sender)
    NSUserDefaults.standardUserDefaults.setObject(
        NSArchiver.archivedDataWithRootObject(backgroundColorWell.color),
        forKey: "backgroundColor"
      )
  end
  
  def changeTextColor(sender)
    NSUserDefaults.standardUserDefaults.setObject(
        NSArchiver.archivedDataWithRootObject(textColorWell.color),
        forKey: "textColor"
      )
  end
  
  private
  
  def unarchiveColorForKey(key)
    NSUnarchiver.unarchiveObjectWithData(
        NSUserDefaults.standardUserDefaults.dataForKey(key)
      )
  end
end
