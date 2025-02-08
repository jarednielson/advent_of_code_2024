class DistanceFinder
  attr_reader :left, :right

  def initialize(left:, right:)
    @left = left.sort
    @right = right.sort
  end
end