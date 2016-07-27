class Node
  attr_accessor :value, :next_node
  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(data)
     if @head.nil?
       @head = data
       @tail = data
     else
       @tail.next_node = data
       @tail = data
     end
  end

  def prepend(data)
    if @head.nil?
      @head = data
      @tail = data
    else
      data.next_node = @head
      @head = data
    end
  end

  def size
    count = 1
    node = @head 
    until node.next_node.nil?
      count += 1
      node = node.next_node
    end 
    count
  end
end

list = LinkedList.new
list.append(Node.new(5))
list.append(Node.new(7))
list.prepend(Node.new(14))
list.append(Node.new(34))
p list
p list.size
