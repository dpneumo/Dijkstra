# Dijkstra


## **A Ruby implementation of Dijkstra algorithm**

See [https://en.wikipedia.org/wiki/Dijkstra's_algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) Dijkstra's algorithm for finding the shortest paths between nodes in a weighted graph

Though I was aware of Dijkstra's algorithm I had no use case for it until I encountered Advent of Code. Implementing this in Ruby has helped my understanding of the algorithm. Putting it on Github will make it easier for me to find in the future and perhaps be useful to someone else. 

Corrections and recommendations for improvements are welcome.


The 2 classes used:

**Dijkstra** 
 - Initialize with list of nodes  
	- @nodes: nodes to be searched  
    - @q: Set of nodes retrievable on smallest path distance 
    - @visited: List of nodes visited as the algorithm progresses
 - Call shortest_path with the start node and target node
 - Returns an array with: 
	  - list of nodes on the found path the path distance

**Node** 

 - Initialize with it's index in a list of nodes
	 - @pathdist is initialized to infinity for Dijkstra
	 - @nbrs is a hash
		 - key: nbr node index
		 - val: edge distance
	 - <=> method compares nodes by path distance


Ruby does not natively implement a priority queue. The Set, @q, holding nodes that implement the 'spaceship' operator, <=>, and including the Comparable module provides the functionality of a priority queue that Dijkstra requires.

The demo code is my solution to AoC2022 Day12 Part1. It is problem specific but uses the more generic Dijkstra implementation to search for the shortest path.

This implementation is tolerably fast for modest path searches. The AoC2022 Day12 puzzle requires 2 seconds to create the node list and find the shortest path with Ruby 3.1.2 running in a VirtualBox allocated 1 processor. There are optimizations possible within the implementation. 
