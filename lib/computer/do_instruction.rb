#frozen_string_literal: true

class DoInstruction
  def interp(state)
    state.on = true
  end
end