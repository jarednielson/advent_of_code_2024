class Report
  attr_reader :levels

  def initialize(levels:)
    @levels = levels
  end

  def safe?
    return @safe unless @safe.nil?

    all_close = levels.each_cons(2).all? do |first, second|
      (first - second).abs.between?(1, 3)
    end

    @safe = all_close && (all_decreasing || all_increasing)
  end


  private

  def all_decreasing
    levels.each_cons(2).all? do |first, second|
      first < second
    end
  end

  def all_increasing
    levels.each_cons(2).all? do |first, second|
      first > second
    end
  end
end