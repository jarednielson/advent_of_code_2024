require "spec_helper"
require "lib/report"

describe Report do
  it "is initialized with a list" do
    expect(Report.new(levels: [1, 2, 3, 4]).levels).to eq [1, 2, 3, 4]
  end

  it "determines safety" do
    expect(Report.new(levels: [7, 6, 4, 2, 1]).safe?).to eq true
    expect(Report.new(levels: [1, 2, 7, 8, 9]).safe?).to eq false
    expect(Report.new(levels: [9, 7, 6, 2, 1]).safe?).to eq false
    expect(Report.new(levels: [1, 3, 2, 4, 5]).safe?).to eq false
    expect(Report.new(levels: [8, 6, 4, 4, 1]).safe?).to eq false
    expect(Report.new(levels: [1, 3, 6, 7, 9]).safe?).to eq true
  end
end