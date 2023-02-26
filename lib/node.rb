class Node
  include Comparable

  attr_reader :ndx
  attr_accessor :pathdist, :nbrs, :prev
  def initialize(ndx:)
    @ndx = ndx
    @pathdist = Float::INFINITY
    @nbrs = {}
    @prev = nil
  end

  def <=>(other)
    @pathdist <=> other.pathdist
  end
end
