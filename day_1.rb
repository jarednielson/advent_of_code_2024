#!ruby

require_relative 'lib/location_comparator'

input = File.readlines("input/day_1")

lists = input.map(&:strip).map { |s| s.split(/\s+/) }.reduce({ left: [], right: []}) do |accum, (left_in, right_in) |
  accum[:left] << left_in.to_i
  accum[:right] << right_in.to_i
  accum
end

puts LocationComparator.new(**lists).total_distance