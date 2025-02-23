# frozen_string_literal: true

class OrderVerifier
  attr_reader :dependency_graph

  def initialize(dependency_graph:)
    @dependency_graph = dependency_graph
  end

  def valid_order?(order:)
    dependent_pages = order.select { |page| dependency_graph.contains?(page) }
    dependent_pages.each_cons(2).all? do |first, second|
      dependency_graph.descendant?(ancestor: first, descendant: second)
    end
  end
end