# frozen_string_literal: true

require 'spec_helper'
require 'lib/dependency_graph'


describe DependencyGraph do
  it "returns all dependents for a node" do
    dependencies = ["47|53", "47|20"]
    graph = DependencyGraph.new(dependencies: dependencies)

    expect(graph.dependents("47")).to eq ["53", "20"].to_set
  end
end