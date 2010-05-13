require "rake"
require 'rubygems'

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