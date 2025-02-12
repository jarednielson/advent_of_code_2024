#froze_string_literal: true

require 'spec_helper'
require 'lib/interpreter'
require 'lib/mul_instruction'
require 'lib/do_instruction'
require 'lib/dont_instruction'

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
end