# An implementation of linked lists in Ruby

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

  # Adds node to end of list
  def append(data)
     if @head.nil?
       @head = data
       @tail = data
     else
       @tail.next_node = data
       @tail = data
     end
  end

  # Adds node to start of list
  def prepend(data)
    if @head.nil?
      @head = data
      @tail = data
    else
      data.next_node = @head
      @head = data
    end
  end

  # Returns size of list
  def size
    count = 1
    node = @head 
    until node.next_node.nil?
      count += 1
      node = node.next_node
    end 
    count
  end

  # Returns first node in list
  def head
    @head
  end

  # Returns last node in list
  def tail
    @tail
  end

  # Returns node at given index
  def at(index)
    size = self.size
    if index > size || index < 0
      print "Error: Index is not within list boundary!"
      return nil
    end
    count = 1
    node = @head
    until count == index
      count+= 1
      node = node.next_node
    end
    node
  end

  # Deletes last node from list
  def pop
    if @head.nil?
      print "Error: Empty List, cannot delete!"
      return nil
    elsif @head == @tail
      node = @head
      @head = nil
      @tail = nil
    elsif @head.next_node == @tail
      node = @head
      node.next_node = nil
      @tail = @head
    else
      node = @head
      until node.next_node.next_node.nil?
        node = node.next_node
      end
      node.next_node = nil
      @tail = node
    end
  end

  # Returns true if list contains value; otherwise, false
  def contains?(data)
    if @head.nil?
      print "List is empty!"
      return false
    else
      node = @head
      until node.value == data
        node = node.next_node
        if node == @tail && node.value != data
          return false
        end
      end
      return true
    end
  end
end

# Tests

list = LinkedList.new
list.append(Node.new(5))
list.append(Node.new(7))
list.prepend(Node.new(14))
list.append(Node.new(34))
list.prepend(Node.new("great"))

p list
puts

puts "Size: #{list.size}"
puts list.head
puts list.tail
puts
puts list.at(3)
puts list.at(5)
puts list.at(15)
puts list.at(-5)
puts

puts list.contains?(5)
puts list.contains?(34)
puts list.contains?(30)
puts

list.pop
p list
list.pop
p list
list.pop
p list
list.pop
p list
list.pop
p list
list.pop
puts
list.contains?(34)
