#!ruby

require_relative '../lib/report'

input = File.readlines(File.expand_path("../input/day_2", File.dirname(__FILE__)))

reports = input.map do |raw_levels|
  Report.new(levels: raw_levels.split(/\s+/).map(&:to_i))
end

safe_reports = reports.select do |report|
  report.safe?
end

puts "Num Safe Reports: #{safe_reports.length}"