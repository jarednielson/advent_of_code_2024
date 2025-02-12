#frozen_string_literal: true

require 'spec_helper'
require 'lib/instruction_cleaner'

describe InstructionCleaner do
  it "parses corrupted multiplication instructions" do
    expect(InstructionCleaner.new(
      raw_memory: "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    ).instructions).to eq %w[mul(2,4) mul(5,5) mul(11,8) mul(8,5)]
  end
end