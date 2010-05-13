# ApplicationController.rb
# Raffle
#
# Created by phuesler on 13.05.10.
# Copyright 2010 huesler informatik. All rights reserved.
class ApplicationController
  attr_accessor :contentView
  
  def applicationDidFinishLaunching(sender)
    NSLog("Launched app")
  end
  
  def toggleFullscreen(sender)
    if contentView.isInFullScreenMode
      contentView.exitFullScreenModeWithOptions(nil)
    else
      contentView.enterFullScreenMode(contentView.window.screen,withOptions:nil)
      contentView.subviews.each do |subview|
        subview.removeFromSuperview
        contentView.addSubview(subview)
      end
    end
  end
end