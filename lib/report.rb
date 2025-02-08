class Report
  attr_reader :levels

  def initialize(levels:)
    @levels = levels
  end

  def safe?
    return @safe unless @safe.nil?

    return @safe = true if bad_levels_from_distance.empty? && bad_levels_from_decreasing.empty? && bad_levels_from_increasing.empty?
    return @safe = true if bad_levels_from_distance.empty? || (bad_levels_from_distance.length == 1 && (bad_levels_from_distance == bad_levels_from_decreasing || bad_levels_from_distance == bad_levels_from_increasing))

    @safe = false
  end


  private

  def bad_levels_from_distance
    @bad_levels_from_distance ||= levels.each_cons(2).each_with_index.map do |(first, second), index|
      index unless (first - second).abs.between?(1, 3)
    end.compact
  end


  def bad_levels_from_decreasing
    return @bad_levels_from_decreasing unless @bad_levels_from_decreasing.nil?

    bad_levels = levels.each_cons(2).each_with_index.map do |(first, second), index|
      index if first >= second
    end.compact

    @bad_levels_from_decreasing = (bad_levels.length == 0  || bad_levels.length == levels.length - 1) ? [] : bad_levels
  end

  def bad_levels_from_increasing
    return @bad_levels_from_increasing unless @bad_levels_from_increasing.nil?

    bad_levels = levels.each_cons(2).each_with_index.map do |(first, second), index|
      index if first <= second
    end.compact

    @bad_levels_from_increasing = (bad_levels.length == 0  || bad_levels.length == levels.length - 1) ? [] : bad_levels
  end
end