#frozen_string_literal: true

require 'spec_helper'
require 'lib/mul_instruction'

describe MulInstruction do
  subject(:mul_instruction) { MulInstruction.new(l_operand: 20, r_operand: 31) }

  it "can read and interpret the instruction" do
    expect(mul_instruction.interp).to eq 20 * 31
  end

  it "has an l_operand" do
    expect(mul_instruction.l_operand).to eq 20
  end

  it "has an r_operand" do
    expect(mul_instruction.r_operand).to eq 31
  end
end