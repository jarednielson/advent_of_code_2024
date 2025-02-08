#!ruby

require_relative '../lib/report'

input = File.readlines(File.expand_path("../input/day_2", File.dirname(__FILE__)))

safe_reports = input.select do |raw_levels|
  Report.new(levels: raw_levels.split(/\s+/).map(&:to_i)).safe?
end

puts "Num Safe Reports: #{safe_reports.length}"