# frozen_string_literal: true

class XMasPuzzle
  attr_reader :puzzle

  def initialize(puzzle:)
    @puzzle = puzzle
  end

  def num_occurences
    return @num_occurences unless @num_occurences.nil?

    @num_occurences = 0
    puzzle.each_with_index do |row, row_idx|
      row.each_with_index do |char, col_idx|
        @row_idx = row_idx
        @col_idx = col_idx

        @num_occurences += 1 if is_xmas?
      end
    end
    @num_occurences
  end

  private

  attr_reader :row_idx, :col_idx

  def is_xmas?
    return false unless char_at == 'A'

    return false unless up_left == 'M' && down_right == 'S' || up_left == 'S' && down_right == 'M'
    return false unless down_left == 'M' && up_right == 'S' || down_left == 'S' && up_right == 'M'

    true
  end

  def char_at
    return nil if row_idx < 0 || col_idx < 0

    puzzle.dig(row_idx, col_idx)
  end

  def up_left
    return nil if row_idx < 1 || col_idx < 1

    puzzle.dig(row_idx - 1, col_idx - 1)
  end

  def up_right
    return nil if row_idx < 1

    puzzle.dig(row_idx - 1, col_idx + 1)
  end

  def down_left
    return nil if col_idx < 1

    puzzle.dig(row_idx + 1, col_idx - 1)
  end

  def down_right
    puzzle.dig(row_idx + 1, col_idx + 1)
  end
end