#froze_string_literal: true

class Interpreter
  attr_reader :instructions

  def initialize(instructions:)
    @instructions = instructions
  end

  def result
    return @result unless @result.nil?

    state = State.new

    instructions.each do |instruction|
      instruction.interp(state)
    end
    state.result
  end

  class State
    attr_accessor :on, :result

    def initialize
      @on = true
      @result = 0
    end
  end
end