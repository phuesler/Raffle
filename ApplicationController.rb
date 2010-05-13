# ApplicationController.rb
# Raffle
#
# Created by phuesler on 13.05.10.
# Copyright 2010 huesler informatik. All rights reserved.
class ApplicationController
  attr_accessor :contentView, :nameLabel
  
  def applicationDidFinishLaunching(sender)
    NSLog("Launched app")
    contentView.layer.backgroundColor = CGColorCreateGenericRGB(0, 0, 0, 1)
    @raffle = Raffle.new(["Peter Moosmeier", "James Brown", "Jack Richardson", "Michael Jackson"], self)
    # contentView.enterFullScreenMode(contentView.window.screen,withOptions:nil)
  end
  
  def raffle(sender)
    @raffle.raffle
  end
  
  def updateName(name)
    NSLog(name)
    nameLabel.stringValue = name
  end
  
  def toggleFullscreen(sender)
    if contentView.isInFullScreenMode
      contentView.exitFullScreenModeWithOptions(nil)
    else
      contentView.enterFullScreenMode(contentView.window.screen,withOptions:nil)
      # contentView.subviews.each do |subview|
      #   subview.removeFromSuperview
      #   contentView.addSubview(subview)
      # end
    end
  end
end