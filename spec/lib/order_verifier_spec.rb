# frozen_string_literal: true

require 'spec_helper'
require 'lib/dependency_graph'
require 'lib/order_verifier'

describe OrderVerifier do
  let(:graph) do
    dependencies = %w[47|53 97|13 97|61 97|47 75|29 61|13 75|53 29|13 97|29 53|29 61|53 97|53 61|29 47|13 75|47 97|75 47|61 75|61 47|29 75|13 53|13]

    DependencyGraph.new(dependencies: dependencies)
  end

  let(:verifier) do
    OrderVerifier.new(dependency_graph: graph)
  end

  [
    %w[75 47 61 53 29],
    %w[97 61 53 29 13],
    %w[75 29 13]
  ].each do |valid_order|
    context "when passing a valid order #{valid_order}" do
      subject { verifier.valid_order?(order: valid_order) }

      it { is_expected.to be true }
    end
  end

  [
    %w[75 97 47 61 53],
    %w[61 13 150 29],
    %w[97 13 75 29 47]
  ].each do |invalid_order|
    context "when passing an invalid order #{invalid_order}" do
      subject { verifier.valid_order?(order: invalid_order) }

      it { is_expected.to be false }
    end
  end

  context "when the graph contains cyclic dependencies" do
    let(:graph) do
      dependencies = %w[1|2 2|3 2|4 4|1 3|5]
      DependencyGraph.new(dependencies: dependencies)
    end

    context "when the ordering contains the dependency" do
      subject { verifier.valid_order?(order: %w[1 2 4]) }

      it { is_expected.to be true }
    end

    context "when the ordering does not contain the dependency" do
      subject { verifier.valid_order?(order: %w[2 3 5]) }

      it { is_expected.to be true }
    end
  end
end