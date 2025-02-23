# frozen_string_literal: true

require 'spec_helper'
require 'lib/dependency_graph'


describe DependencyGraph do
  describe "#dependents" do
    subject { DependencyGraph.new(dependencies: %w[47|53 47|20]).dependents("47") }

    it { is_expected.to eq ["53", "20"].to_set }
  end

  describe "descendant?" do
    let(:graph) { DependencyGraph.new(dependencies: %w[47|53 20|60 53|20]) }

    context "when the value is a descendent" do
      subject { graph.descendant?(ancestor: "47", descendant: "60") }

      it { is_expected.to be true }
    end

    context "when the value is not a descendant" do
      subject { graph.descendant?(ancestor: "20", descendant: "53") }

      it { is_expected.to be false }
    end

    context "when the either value is not in the graph" do
      subject { graph.descendant?(ancestor: "32", descendant: "61") }

      it { is_expected.to be false }
    end
  end
end