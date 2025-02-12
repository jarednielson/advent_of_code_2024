class Report
  attr_reader :levels

  def initialize(levels:)
    @levels = levels
  end

  def safe?
    return @safe unless @safe.nil?

    return @safe = safe_with_dampening?
  end

  def safe_with_dampening?
    potential_indices = [0, levels.length - 1]
    safe = true
    levels.each_cons(3).each_with_index do |(first, second, third), index|
      strictly_ascending = first < second && second < third
      strictly_descending = first > second && second > third

      gap_safe = (first - second).abs.between?(1, 3) && (second - third).abs.between?(1, 3)

      next if (strictly_ascending || strictly_descending) && gap_safe

      strictly_ascending = first < third
      strictly_descending = first > third
      gap_safe = (first - third).abs.between?(1, 3)

      if (strictly_ascending || strictly_descending) && gap_safe
        potential_indices << index + 1
        next
      end
      safe = false
      break
    end
    return true if safe

    potential_indices.any? do |potential_index|
      self.class.new(levels: levels.reject.with_index { |index| index == potential_index }).safe_without_dampening?
    end
  end

  def safe_without_dampening?
    strictly_increasing = levels.each_cons(2).reduce(true) do |accum, (first, second)|
      accum && first < second
    end
    strictly_decreasing = levels.each_cons(2).reduce(true) do |accum, (first, second)|
      accum && first > second
    end

    gap_safe = levels.each_cons(2).reduce(true) do |accum, (first, second)|
      accum && (first - second).abs.between?(1, 3)
    end

    (strictly_decreasing ^ strictly_increasing) && gap_safe
  end
end