# frozen_string_literal: true

class DependencyGraph
  def initialize(dependencies:)
    @graph = dependencies.reduce({}) do |graph, dependency|
      parent, child = dependency.split("|").map do |value|
        graph.fetch(value) { |key| Node.new(value: key) }
      end
      parent.add_dependent(dependent: child)
      graph[parent.value] = parent
      graph[child.value] = child
      graph
    end
  end

  def dependents(value)
    return [] unless graph.key?(value)
    graph[value].dependents.map(&:value)
  end

  private

  attr_reader :graph

  class Node
    attr_reader :value, :dependents

    def initialize(value:)
      @value = value
      @dependents = Set.new
    end

    def add_dependent(dependent:)
      dependents << dependent
    end
  end
end