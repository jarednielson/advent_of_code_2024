#! ruby

require_relative '../lib/dependency_graph'
require_relative '../lib/order_verifier'

lines = File.readlines(File.expand_path("../input/day_5", File.dirname(__FILE__)))
line_break_index = lines.index("\n")

dependencies = lines[...line_break_index].map(&:strip)
orderings = lines[line_break_index + 1 ...].map { |raw_ordering| raw_ordering.strip.split(",") }

graph = DependencyGraph.new(dependencies: dependencies)
order_verifier = OrderVerifier.new(dependency_graph: graph)

valid_orderings = orderings.select do |ordering|
  order_verifier.valid_order?(order: ordering)
end

total = valid_orderings.reduce(0) do |sum, ordering|
  sum += ordering[ordering.length / 2].to_i
  sum
end

puts total