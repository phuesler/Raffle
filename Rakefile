require "rubygems"
require "rake"

require "choctop"
require 'highline/import'

class ChocTop
  def user
    @user ||= ask("User for server please: ")
  end
end

ChocTop.new do |s|
  # Remote upload target (set host if not same as Info.plist['SUFeedURL'])
  s.remote_dir = '/home/mosphere/www/applications.huesler-informatik.ch/downloads/Raffle'
  # Custom DMG
  s.build_target = 'Release'
  s.background_file = "dmg.png"
  # s.app_icon_position = [100, 90]
  # s.applications_icon_position =  [400, 90]
  # s.volume_icon = "dmg.icns"
  # s.applications_icon = "appicon.icns" # or "appicon.png"
end

desc "Generate Sample CSV-File"
task :generate_sample_csv_file do
  require 'faker'
  FileUtils::mkdir_p("tmp")
  File.open(File.join("tmp", "csv_test_file.csv"), "w") do |file|
    100.times do
      file.puts "#{Faker::Name.name}"
    end
  end
end