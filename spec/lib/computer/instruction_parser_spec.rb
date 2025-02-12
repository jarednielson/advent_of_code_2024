#froze_string_literal: true

require 'spec_helper'
require 'lib/computer/instruction_parser'

describe InstructionParser do
  subject(:instruction) { InstructionParser.new(raw_instruction: raw_instruction).instruction }

  context "when the instruction is a mul instruction" do
    let(:raw_instruction) { "mul(2,3)" }

    it { is_expected.to be_a MulInstruction }

    it "is built with integers" do
      expect(instruction.interp).to eq 6
    end
  end

  context "when the instruction is a do instruction" do
    let(:raw_instruction) { "do()" }

    it { is_expected.to be_a DoInstruction }
  end

  context "when the instruction is a do instruction" do
    let(:raw_instruction) { "don't()" }

    it { is_expected.to be_a DontInstruction }
  end

  context "when the instruction does not match" do
    let(:raw_instruction) { "poopoo" }

    it { is_expected.to be_nil }
  end

  describe ".instructions" do
    it "maps all the instructions in the array" do
      instructions = InstructionParser.instructions(raw_instructions: %w[mul(1,2) do() don't()])
      expect(instructions.map(&:class)).to eq [MulInstruction, DoInstruction, DontInstruction]
    end
  end
end