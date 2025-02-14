# frozen_string_literal: true

class WordSearcher
  attr_reader :puzzle, :target

  def initialize(puzzle:, target:)
    @puzzle = puzzle
    @target = target
  end

  def num_occurences
    return @num_occurences unless @occurences.nil?

    @num_occurences = 0

    directions = %i[up down left right up_left up_right down_left down_right]

    puzzle.each_with_index do |row, row_index|
      row.each_with_index do |char, col_index|
        @num_occurences += directions.reduce(0) do |accum, direction|
          accum += 1 if matches?(row_index, col_index, 0, direction)
          accum
        end
      end
    end

    @num_occurences
  end

  private

  def matches?(row, col, target_idx, direction)
    return true if target_idx == target.length
    return false unless char_at(row, col) == target_char_at(target_idx)

    next_row, next_col = next_indices(row, col, direction)
    matches?(next_row, next_col, target_idx + 1, direction)
  end

  def next_indices(row, col, direction)
    transform = transforms[direction]
    [row, col].zip(transform).map { |pos, shift| pos + shift }
  end

  def transforms
    @transforms ||= {
      up: [-1, 0],
      down: [1, 0],
      left: [0, -1],
      right: [0, 1],
      up_left: [-1, -1],
      up_right: [-1, 1],
      down_left: [1, -1],
      down_right: [1, 1]
    }
  end

  def target_char_at(idx)
    target[idx]
  end

  def char_at(row, col)
    return nil if row < 0 || col < 0
    puzzle.dig(row, col)
  end
end