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

    puzzle.each_with_index do |row, row_index|
      row.each_with_index do |char, col_index|
        @num_occurences += 1 if matches_left?(row_index, col_index, 0)
        @num_occurences += 1 if matches_right?(row_index, col_index, 0)
        @num_occurences += 1 if matches_up?(row_index, col_index, 0)
        @num_occurences += 1 if matches_down?(row_index, col_index, 0)
        @num_occurences += 1 if matches_up_right?(row_index, col_index, 0)
        @num_occurences += 1 if matches_up_left?(row_index, col_index, 0)
        @num_occurences += 1 if matches_down_right?(row_index, col_index, 0)
        @num_occurences += 1 if matches_down_left?(row_index, col_index, 0)
      end
    end

    @num_occurences
  end

  private

  def matches_right?(row, col, target_idx)
    return true if target_idx == target.length
    return false unless char_at(row, col) == target_char_at(target_idx)

    matches_right?(row, col + 1, target_idx + 1)
  end

  def matches_left?(row, col, target_idx)
    return true if target_idx == target.length
    return false unless char_at(row, col) == target_char_at(target_idx)

    matches_left?(row, col - 1, target_idx + 1)
  end

  def matches_up?(row, col, target_idx)
    return true if target_idx == target.length
    return false unless char_at(row, col) == target_char_at(target_idx)

    matches_up?(row - 1, col, target_idx + 1)
  end

  def matches_down?(row, col, target_idx)
    return true if target_idx == target.length
    return false unless char_at(row, col) == target_char_at(target_idx)

    matches_down?(row + 1, col, target_idx + 1)
  end

  def matches_up_right?(row, col, target_idx)
    return true if target_idx == target.length
    return false unless char_at(row, col) == target_char_at(target_idx)

    matches_up_right?(row - 1, col + 1, target_idx + 1)
  end

  def matches_up_left?(row, col, target_idx)
    return true if target_idx == target.length
    return false unless char_at(row, col) == target_char_at(target_idx)

    matches_up_left?(row - 1, col - 1, target_idx + 1)
  end

  def matches_down_right?(row, col, target_idx)
    return true if target_idx == target.length
    return false unless char_at(row, col) == target_char_at(target_idx)

    matches_down_right?(row + 1, col + 1, target_idx + 1)
  end

  def matches_down_left?(row, col, target_idx)
    return true if target_idx == target.length
    return false unless char_at(row, col) == target_char_at(target_idx)

    matches_down_left?(row + 1, col - 1, target_idx + 1)
  end

  def target_char_at(idx)
    target[idx]
  end

  def char_at(row, col)
    return nil if row < 0 || col < 0
    puzzle.dig(row, col)
  end
end