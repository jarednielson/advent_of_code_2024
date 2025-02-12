#frozen_string_literal: true

require 'ostruct'
require 'spec_helper'
require 'lib/dont_instruction'

describe DontInstruction do
  subject(:dont_instruction) { DontInstruction.new }

  it "it interps with state" do
    state = OpenStruct.new(on: true)
    dont_instruction.interp(state)
    expect(state.on).to eq false
  end
end