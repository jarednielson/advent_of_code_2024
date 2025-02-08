require 'spec_helper'
require 'lib/distance_finder'


describe DistanceFinder do
  it "sorts both lists on itialization" do
    finder = DistanceFinder.new(left: [2, 1, 3], right: [3, 2, 1])
    expect(finder.left).to eq [1, 2, 3]
    expect(finder.right).to eq [1, 2, 3]
  end
end
