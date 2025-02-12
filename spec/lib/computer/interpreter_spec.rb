#froze_string_literal: true

require 'spec_helper'
require 'lib/computer/interpreter'
require 'lib/computer/mul_instruction'
require 'lib/computer/do_instruction'
require 'lib/computer/dont_instruction'

describe Interpreter do
  subject(:interpreter) { Interpreter.new(instructions: instructions) }
  let(:instructions) do
    [
      MulInstruction.new(l_operand: 2, r_operand: 3),
      MulInstruction.new(l_operand: 4, r_operand: 5)
    ]
  end

  it "interpets and accumulates instructions" do
    expect(interpreter.result).to eq 26
  end

  context "when instructions include do's and don'ts" do
    let(:instructions) do
      [
        MulInstruction.new(l_operand: 4, r_operand: 8),
        DontInstruction.new,
        MulInstruction.new(l_operand: 7, r_operand: 12),
        DoInstruction.new,
        MulInstruction.new(l_operand: 5, r_operand: 5),
      ]
    end

    it "does not accumulate when do is off" do
      expect(interpreter.result).to eq 32 + 25
    end
  end
end