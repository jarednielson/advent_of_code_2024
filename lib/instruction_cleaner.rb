#frozen_string_literal: true

class InstructionCleaner
  attr_reader :raw_memory

  MUL_INSTR_PATTERN = /mul\(\d+,\d+\)/
  DO_INSTR_PATTERN = /do\(\)/
  DONT_INSTR_PATTERN = /don't\(\)/

  INSTR_PATTERN = /#{MUL_INSTR_PATTERN}|#{DO_INSTR_PATTERN}|#{DONT_INSTR_PATTERN}/

  def initialize(raw_memory:)
    @raw_memory = raw_memory
  end

  def instructions
    return @instructions unless @instructions.nil?
    @instructions = raw_memory.scan(INSTR_PATTERN)
  end
end