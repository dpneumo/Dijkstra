# Node
#   Initialize with it's index in a list of nodes
#     @pathdist is initialized to infinity for Dijkstra
#     @nbrs is a hash
#       key: nbr node index
#       val: edge distance
#   <=> method allows Dijkstra#q_shortest to work
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
