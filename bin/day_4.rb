#! ruby

require_relative '../lib/word_searcher'
require_relative '../lib/x_mas_puzzle'

lines = File.readlines(File.expand_path("../input/day_4", File.dirname(__FILE__)))

puzzle = lines.map(&:chars)
target = "XMAS"

searcher = WordSearcher.new(puzzle: puzzle, target: target)

xmas_puzzle = XMasPuzzle.new(puzzle: puzzle)

puts "Num XMAS Occurences: #{searcher.num_occurences}"
puts "Num 'X'-'MAS' occurences: #{xmas_puzzle.num_occurences}"