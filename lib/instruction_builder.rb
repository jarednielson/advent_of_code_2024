#frozen_string_literal

require 'lib/mul_instruction'
require 'lib/do_instruction'
require 'lib/dont_instruction'

class InstructionBuilder
  attr_reader :raw_instruction

  def initialize(raw_instruction:)
    @raw_instruction = raw_instruction
  end

  def instruction
    if raw_instruction.start_with?("mul(")
      MulInstruction.new(instruction: raw_instruction)
    elsif raw_instruction == "do()"
      DoInstruction.new
    elsif raw_instruction == "don't()"
      DontInstruction.new
    end
  end
end