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
end