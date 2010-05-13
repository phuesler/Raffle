# ApplicationController.rb
# Raffle
#
# Created by phuesler on 13.05.10.
# Copyright 2010 huesler informatik. All rights reserved.
require 'csv'

class ApplicationController
  attr_accessor :contentView, :nameLabel, :raffleButton, :preferenceController
  
  def init
    if !super
      return nil
    end
    
    center = NSNotificationCenter.defaultCenter
    center.addObserver(self,
                       selector: :"handleTextColorChange:",
                       name: PreferenceController::TextColorChangedNotification,
                       object: nil)
   center.addObserver(self,
                      selector: :"handleBackgroundColorChange:",
                      name: PreferenceController::BackgroundColorChangedNotification,
                      object: nil)
    return self
  end
  
  def handleBackgroundColorChange(notification)
    contentView.layer.backgroundColor = convertColor(preferenceController.backgroundColor)
  end
  
  def handleTextColorChange(notification)
    nameLabel.setTextColor(preferenceController.textColor)
  end
  
  def awakeFromNib
    handleTextColorChange(nil)
    handleBackgroundColorChange(nil)
  end
  
  def showOpenPanel(sender)
    dialog = NSOpenPanel.openPanel
    dialog.canChooseFiles = true
    dialog.canChooseDirectories = false
    dialog.allowsMultipleSelection = false
    # FIXME: filter files to csv
    if dialog.runModalForDirectory(nil, file:nil) == NSOKButton
      @raffle = Raffle.new(read_csv(dialog.filenames.first), self)
      raffleButton.enabled = true
    end
  end
  
  def preferenceController
    unless @preferenceController
      @preferenceController = PreferenceController.alloc.init
    end
    @preferenceController
  end
  
  def showPreferencePanel(sender)
    preferenceController.showWindow(self)
  end
  
  def raffle(sender)
    @raffle.raffle
  end
  
  def updateName(name)
    nameLabel.stringValue = name
  end
  
  def toggleFullscreen(sender)
    if contentView.isInFullScreenMode
      contentView.exitFullScreenModeWithOptions(nil)
    else
      contentView.enterFullScreenMode(contentView.window.screen,withOptions:nil)
    end
  end
  
  
  private
  
  def read_csv(path)
    names = []
    CSV.foreach(path) do |row|
      names << row[0]
    end
    names
  end
  
  def convertColor(color)
    CGColorCreateGenericRGB(color.redComponent, color.greenComponent, color.blueComponent, 1)
  end
end