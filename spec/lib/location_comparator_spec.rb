require 'spec_helper'
require 'lib/location_comparator'


describe LocationComparator do
  it "sorts both lists on itialization" do
    finder = LocationComparator.new(left: [2, 1, 3], right: [3, 2, 1])
    expect(finder.left).to eq [1, 2, 3]
    expect(finder.right).to eq [1, 2, 3]
  end

  context "when left and right have mismatched lengths" do
    it "raises a helpful error" do
      expect {
        LocationComparator.new(left: [1, 2], right: [1, 2, 3])
      }.to raise_error LocationComparator::ListLengthMismatch
    end
  end

  it "calculates the distance between the two lists" do
    expect(LocationComparator.new(left: [4, 2, 12], right: [6, 5, 9]).total_distance).to eq 8
  end

  it "calculates a similarity score between the two lists" do
    expect(LocationComparator.new(left: [4, 2, 12, 6], right: [5, 2, 2, 12]).similarity_score).to eq 16
  end
end
