class DistanceFinder
  class ListLengthMismatch < StandardError; end
  attr_reader :left, :right

  def initialize(left:, right:)
    raise ListLengthMismatch.new "Lists must be the same length. Left length: #{left.length} -- Right length: #{right.length}" if left.length != right.length
    @left = left.sort
    @right = right.sort
  end
end