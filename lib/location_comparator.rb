class LocationComparator
  class ListLengthMismatch < StandardError; end
  attr_reader :left, :right

  def initialize(left:, right:)
    raise ListLengthMismatch.new "Lists must be the same length. Left length: #{left.length} -- Right length: #{right.length}" if left.length != right.length
    @left = left.sort
    @right = right.sort
  end

  def total_distance
    if @total_distance.nil?
      left.zip(right).reduce(0) do |total_distance, (left_location, right_location)|
        total_distance += (left_location - right_location).abs
      end
    end
  end

  def similarity_score
    if @similarity_score.nil?
      right_occurence_counts = right.reduce(Hash.new(0)) do |accum, right_location|
        accum[right_location] += 1
        accum
      end

      @similarity_score = left.reduce(0) do |running_score, left_location|
        running_score + left_location * right_occurence_counts[left_location]
      end
    end
    @similarity_score
  end
end