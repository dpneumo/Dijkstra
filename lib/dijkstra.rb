# Dijkstra algorithm
#   Initialize with the nodes to be searched. (class Node for details)
#   Call #shortest_path with the start node and target node
#   Returns an array with:
#     list of nodes on the found path
#     the path distance
require 'set'
require_relative "node.rb"

class Dijkstra
  def initialize(nodes:)
    @nodes = nodes
    @q = Set.new(@nodes)
    @visited = Array.new(@nodes.size, false)
  end

  def shortest_path(start:, tgt:)
    setup_start_node(start)
    (0..).each do |_|
      current = q_shortest
      return [ [], Float::INFINITY ] if failed_at(current)
      return path_data(current) if current.ndx == tgt.ndx
      update_nbrs(current)
    end
  end

  def update_nbrs(current)
    current.nbrs.each do |ndx,edgedist|
      next if @visited[ndx]
      neighbor = @nodes[ndx]
      neighbor.pathdist = current.pathdist + edgedist
      neighbor.prev = current
      @visited[ndx] = true
    end
  end

  def q_shortest
    qs = @q.min
    @q.delete qs
    qs
  end

  def path_data(current)
    [ path(current), current.pathdist ]
  end

  def path(current)
    path = []
    while current.prev do
      path.unshift(current.prev)
      current = current.prev
    end
    path
  end

  def failed_at(current)
    !current || current.pathdist.infinite?
  end

  def setup_start_node(start)
    @nodes[start.ndx].pathdist = 0
    @visited[start.ndx] = true
  end
end
