#frozen_string_literal: true

class MulInstruction
  attr_reader :l_operand, :r_operand


  def initialize(l_operand:, r_operand:)
    @l_operand = l_operand
    @r_operand = r_operand
  end

  def interp(state = nil)
    result = l_operand * r_operand
    if state && state.on
      state.result += result
    end
    result
  end
end