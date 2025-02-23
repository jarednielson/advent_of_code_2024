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
    graph[value].dependents.values.map(&:value).to_set
  end

  def descendant?(ancestor:, descendant:)
    return false unless graph.key?(ancestor) && graph.key?(descendant)

    ancestor = graph[ancestor]
    descendant = graph[descendant]

    !ancestor.dig(descendant).nil?
  end

  private

  attr_reader :graph

  class Node
    attr_reader :value, :dependents

    def initialize(value:)
      @value = value
      @dependents = {}
    end

    def add_dependent(dependent:)
      dependents[dependent.value] = dependent
    end

    def dig(node)
      return dependents[node.value] if dependents.key?(node.value)

      dependents.each do |_key, val|
        result = val.dig(node)
        return result unless result.nil?
      end

      return nil
    end
  end
end