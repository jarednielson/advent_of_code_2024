#frozen_string_literal

require 'lib/mul_instruction'
require 'lib/do_instruction'
require 'lib/dont_instruction'

class InstructionParser
  attr_reader :raw_instruction

  MUL_INSTR_PATTERN = /mul\((\d+),\s*(\d+)\)/
  DO_INSTR_PATTERN = /do\(\)/
  DONT_INSTR_PATTERN = /don't\(\)/

  def self.instructions(raw_instructions:)
    raw_instructions.map do |raw_instruction|
      new(raw_instruction: raw_instruction).instruction
    end
  end

  def initialize(raw_instruction:)
    @raw_instruction = raw_instruction
  end

  def instruction
    if match = MUL_INSTR_PATTERN.match(raw_instruction)
      MulInstruction.new(l_operand: match[1].to_i, r_operand: match[2].to_i)
    elsif DO_INSTR_PATTERN.match?(raw_instruction)
      DoInstruction.new
    elsif DONT_INSTR_PATTERN.match?(raw_instruction)
      DontInstruction.new
    end
  end
end