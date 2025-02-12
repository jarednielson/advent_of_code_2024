#frozen_string_literal: true

class MulInstruction
  class MalformedInstruction < StandardError; end

  attr_reader :instruction, :l_operand, :r_operand

  PATTERN = /mul\((\d+),\s*(\d+)\)/

  def initialize(instruction:)
    match_data = PATTERN.match(instruction)
    raise MalformedInstruction.new("#{instruction} is not a valid mul instruction") unless match_data
    @instruction = match_data[0]
    @l_operand = match_data[1].to_i
    @r_operand = match_data[2].to_i
  end

  def interp
    l_operand * r_operand
  end
end