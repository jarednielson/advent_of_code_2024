# frozen_string_literal: true

require 'spec_helper'
require 'lib/word_searcher'

describe WordSearcher do
  it "counts the occurance of xmas" do
    puzzle = [
      ["M","M","M","S","X","X","M","A","S","M",],
      ["M","S","A","M","X","M","S","M","S","A",],
      ["A","M","X","S","X","M","A","A","M","M",],
      ["M","S","A","M","A","S","M","S","M","X",],
      ["X","M","A","S","A","M","X","A","M","M",],
      ["X","X","A","M","M","X","X","A","M","A",],
      ["S","M","S","M","S","A","S","X","S","S",],
      ["S","A","X","A","M","A","S","A","A","A",],
      ["M","A","M","M","M","X","M","M","M","M",],
      ["M","X","M","X","A","X","M","A","S","X",]
    ]

    target = "XMAS"

    expect(WordSearcher.new(puzzle: puzzle, target: target).num_occurences).to eq 18
  end
end