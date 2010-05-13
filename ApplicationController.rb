# ApplicationController.rb
# Raffle
#
# Created by phuesler on 13.05.10.
# Copyright 2010 huesler informatik. All rights reserved.
require 'csv'

class ApplicationController
  attr_accessor :contentView, :nameLabel
  
  def applicationDidFinishLaunching(sender)
    @raffle = Raffle.new(read_csv, self)
  end
  
  def awakeFromNib
    contentView.layer.backgroundColor = CGColorCreateGenericRGB(0, 0, 0, 1)
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
  
  def read_csv
    names = []
    CSV.foreach(File.expand_path(File.dirname(__FILE__)) + '/../../../../../tmp/csv_test_file.csv') do |row|
      names << row[0]
    end
    names
  end
end