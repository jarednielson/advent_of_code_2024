#! ruby

require_relative '../lib/word_searcher'

lines = File.readlines(File.expand_path("../input/day_4", File.dirname(__FILE__)))

puzzle = lines.map(&:chars)
target = "XMAS"

searcher = WordSearcher.new(puzzle: puzzle, target: target)

puts "Num Occurences: #{searcher.num_occurences}"