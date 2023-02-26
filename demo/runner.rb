require_relative "../lib/dijkstra"

Test = true
class Runner
  def initialize
    data_extension = Test ? "_test" : "" 
    @map_data = "#{File.dirname(__FILE__)}/map#{data_extension}.txt"
   end

  def run
    read_file
    find_start_and_tgt
    build_nodes
    path, pathdist = find_path_list
    puts pathdist
  end

  def read_file
    map = []
    File.foreach(@map_data) do |line|
      row = line.chomp.split('')
      map << row
    end
    @rows = map.size
    @cols = map[0].size
    @squares = map.flatten
  end

  def find_start_and_tgt
    @squares.each_index do |i|
      if @squares[i] == 'S'
        @start = i
        @squares[i] = 'a'
      elsif @squares[i] == 'E'
        @tgt = i
        @squares[i] = 'z'
      end
    end
  end

  def build_nodes
    @nodes = @squares.each_index.map {|ndx| Node.new(ndx: ndx) }
    @nodes.each do |node|
      ndxlist = nbr_ndxs(node.ndx)
      ndxlist.each {|i| node.nbrs[i] = 1 }
    end
  end

  def find_path_list
    dkstra = Dijkstra.new(nodes: @nodes)
    startnode = @nodes[@start]
    tgtnode = @nodes[@tgt]
    dkstra.shortest_path(start: startnode, tgt: tgtnode)
  end

  def nbr_ndxs(ndx)
    poss = [ndx-1, ndx+1, ndx-@cols, ndx+@cols]
    poss.select {|nbr| valid?(nbr) && !too_high?(ndx, nbr) }
  end

  def valid?(nbr)
    (0..@squares.size-1).include? nbr
  end

  def too_high?(ndx, nbr)
    @squares[nbr].ord - @squares[ndx].ord > 1
  end
end

Runner.new.run
