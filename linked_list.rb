class Node
  attr_accessor :value, :next_node
  def initialize(value)
    @value = nil
    @next_node = nil
  end
end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end
end

