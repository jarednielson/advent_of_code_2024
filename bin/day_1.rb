#!ruby

require_relative '../lib/location_comparator'

input = File.readlines(File.expand_path("../input/day_1", File.dirname(__FILE__)))

lists = input.map(&:strip).map { |s| s.split(/\s+/) }.reduce({ left: [], right: []}) do |accum, (left_in, right_in) |
  accum[:left] << left_in.to_i
  accum[:right] << right_in.to_i
  accum
end

comparator = LocationComparator.new(**lists)

puts "Total Distance: #{comparator.total_distance}"
puts "Similarity Score: #{comparator.similarity_score}"