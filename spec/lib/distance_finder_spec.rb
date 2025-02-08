require 'spec_helper'
require 'lib/distance_finder'


describe DistanceFinder do
  it "sorts both lists on itialization" do
    finder = DistanceFinder.new(left: [2, 1, 3], right: [3, 2, 1])
    expect(finder.left).to eq [1, 2, 3]
    expect(finder.right).to eq [1, 2, 3]
  end

  context "when left and right have mismatched lengths" do
    it "raises a helpful error" do
      expect {
        DistanceFinder.new(left: [1, 2], right: [1, 2, 3])
      }.to raise_error DistanceFinder::ListLengthMismatch
    end
  end
end
