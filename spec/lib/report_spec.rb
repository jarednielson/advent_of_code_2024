require "spec_helper"
require "lib/report"

describe Report do
  it "is initialized with a list" do
    expect(Report.new([1, 2, 3, 4]).levels).to eq [1, 2, 3, 4]
  end
end