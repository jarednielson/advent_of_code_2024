class LocationComparator
  class ListLengthMismatch < StandardError; end
  attr_reader :left, :right

  def initialize(left:, right:)
    raise ListLengthMismatch.new "Lists must be the same length. Left length: #{left.length} -- Right length: #{right.length}" if left.length != right.length
    @left = left.sort
    @right = right.sort
  end

  def total_distance
    return @total_distance unless @total_distance.nil?

    @total_distance = left.zip(right).reduce(0) do |total_distance, (left_location, right_location)|
      total_distance += (left_location - right_location).abs
    end
  end

  def similarity_score
    return @similarity_score unless @similarity_score.nil?

    right_occurence_counts = right.reduce(Hash.new(0)) do |accum, right_location|
      accum[right_location] += 1
      accum
    end

    @similarity_score = left.reduce(0) do |running_score, left_location|
      running_score + left_location * right_occurence_counts[left_location]
    end
  end
end