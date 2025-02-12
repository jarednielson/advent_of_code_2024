#frozen_string_literal: true

class DontInstruction
  def interp(state)
    state.on = false
  end
end