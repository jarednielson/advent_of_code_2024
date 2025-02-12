#frozen_string_literal: true

require 'ostruct'
require 'spec_helper'
require 'lib/do_instruction'

describe DoInstruction do
  subject(:do_instruction) { DoInstruction.new }

  it "it evals with state" do
    state = OpenStruct.new(on: false)
    do_instruction.interp(state)
    expect(state.on).to eq true
  end
end