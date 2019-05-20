require 'pry'

class Graph
  attr_reader :nodes

  def initialize(*nodes)
    @nodes = []

    nodes.each do |node|
      add(node)
    end
  end

  def append(node, *children)
    node = add(node)

    children.each do |child|
      node.append(self, child)
    end

    node
  end

  def dfs(node, value, marked={})
    return false if marked[node]
    return marked.count if node.value == value
    marked[node] = true

    node.children.each do |child|
      result = dfs(child, value, marked)
      return result if result
    end

    false
  end

  def bfs(node, value)
    queue = []
    marked = {}

    marked[node] = true
    path = [node]
    queue << path

    while queue.count > 0
      path = queue.shift

      return path if path.last.value == value

      path.last.children.each do |child|
        if !marked[child]
          marked[child] = true
          child_path = path + [child]
          queue << child_path
        end
      end
    end

    false
  end

  def add(node)
    return node if @nodes.include?(node)

    node = Node.new(node) if node.class.name != 'Node'

    @nodes << node

    node
  end

end

class Tree < Graph
  attr_reader :root

  def initialize(root)
    @nodes = []

    root = Node.new(root) if root.class.name != 'Node'
    @root = root

    @nodes << root
  end

  def append(node, *children)
    raise 'Must append to existing node' if !@nodes.include?(node)

    children.each do |child|
      raise "#{child} is already appended to a parent node" if @nodes.include?(child)
    end

    super
  end
end

class Node
  attr_reader :value, :children
  attr_writer :value

  def initialize(value)
    @value = value
    @children = []
  end

  def append(graph, *nodes)
    graph.add(self)

    nodes.each do |node|
      node = graph.add(node)

      @children << node if !@children.include?(node)
    end

    graph
  end
end

graph = Graph.new
nodes = (0..8).to_a

nodes = nodes.map { |value| graph.append(value) }

graph.append(nodes[0], nodes[1], nodes[8])
graph.append(nodes[1], nodes[2])
graph.append(nodes[2], nodes[0], nodes[3])
graph.append(nodes[3], nodes[2], nodes[7])
graph.append(nodes[4], nodes[6])
graph.append(nodes[5], nodes[4])
graph.append(nodes[6], nodes[5])

nodes = (0..13).to_a
nodes = nodes.map { |value| Node.new(value) }
tree = Tree.new(nodes[0])

tree.append(nodes[0], nodes[1], nodes[2], nodes[3])
tree.append(nodes[1], nodes[4])
tree.append(nodes[2], nodes[5], nodes[6])
tree.append(nodes[3], nodes[7], nodes[8])
tree.append(nodes[4], nodes[9])
tree.append(nodes[5], nodes[10], nodes[11])
tree.append(nodes[7], nodes[12])
tree.append(nodes[8], nodes[13])

puts tree.bfs(nodes[0], 20)

puts ''
