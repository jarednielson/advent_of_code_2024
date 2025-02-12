#frozen_string_literal: true

require 'spec_helper'
require 'lib/mul_instruction'

describe MulInstruction do
  subject(:mul_instruction) { MulInstruction.new(instruction: instruction) }
  context "when the instruction is properly formatted" do
    let(:instruction) { "mul(20,31)" }

    it "can read and evaluate the instruction" do
      expect(mul_instruction.eval).to eq 20 * 31
    end

    it "has an l_operand" do
      expect(mul_instruction.l_operand).to eq 20
    end

    it "has an r_operand" do
      expect(mul_instruction.r_operand).to eq 31
    end
  end

  context "when the instruction is not properly formatted" do
    let(:instruction) { "poopoopeepee" }

    it "raises a helpful error" do
      expect do
        subject
      end.to raise_error MulInstruction::MalformedInstruction
    end
  end
end