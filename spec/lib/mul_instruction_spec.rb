#frozen_string_literal: true

require 'spec_helper'
require 'lib/mul_instruction'

describe MulInstruction do
  context "when the instruction is properly formatted" do
    let(:instruction) { "mul(20,31)" }
    it "can read and evaluate the instruction" do
      expect(MulInstruction.new(instruction: instruction).eval).to eq 20 * 31
    end

    it "has an l_operand" do
      expect(MulInstruction.new(instruction: instruction).l_operand).to eq 20
    end

    it "has an r_operand" do
      expect(MulInstruction.new(instruction: instruction).r_operand).to eq 31
    end
  end
end