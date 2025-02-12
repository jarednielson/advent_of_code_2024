#frozen_string_literal: true

class InstructionCleaner
  attr_reader :raw_memory

  MUL_INSTR_PATTERN = /mul\(\d+,\d+\)/

  def initialize(raw_memory:)
    @raw_memory = raw_memory
  end

  def instructions
    return @instructions unless @instructions.nil?
    @instructions = raw_memory.scan(MUL_INSTR_PATTERN)
  end
end