require 'pry'

string = "I am a majestic unicorn from outer space!"

class Tree
  attr_reader :nodes, :root

  def initialize(string)
    @string = string
    @nodes = []
    create_nodes
    tree_up
  end

  def create_nodes
    arr = @string.split('')

    arr.each do |char|
      node = @nodes.find { |node| node.name == char }

      if node
        node.count += 1
      else
        @nodes << Node.new(char)
      end
    end
  end

  def tree_up
    queue = @nodes.sort_by { |node| node.count }
    parent = nil

    while queue.count > 0
      left = queue.shift
      right = parent || queue.shift
      parent_count = left.count + right.count
      parent = Node.new(nil, parent_count, left, right)
    end

    @root = parent
  end

end

class Node
  attr_reader :name
  attr_accessor :left, :right, :count

  def initialize(name, count = 1, left = nil, right = nil)
    @name = name
    @count = count
    @left = left
    @right = right
  end

end

tree = Tree.new(string)
puts tree.root.count
