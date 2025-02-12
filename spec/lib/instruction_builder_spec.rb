#froze_string_literal: true

require 'spec_helper'
require 'lib/instruction_builder'

describe InstructionBuilder do
  subject(:builder) { InstructionBuilder.new(raw_instruction: raw_instruction).instruction }

  context "when the instruction is a mul instruction" do
    let(:raw_instruction) { "mul(2,3)" }

    it { is_expected.to be_a MulInstruction }
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
end