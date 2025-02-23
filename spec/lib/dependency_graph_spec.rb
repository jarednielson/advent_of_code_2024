# frozen_string_literal: true

require 'spec_helper'
require 'lib/dependency_graph'


describe DependencyGraph do
  describe "#dependents" do
    subject { DependencyGraph.new(dependencies: %w[47|53 47|20]).dependents("47") }

    it { is_expected.to eq ["53", "20"].to_set }
  end
end