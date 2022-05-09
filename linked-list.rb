# Class used by linked_list to store individual nodes
class Node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
  attr_accessor :next_node, :value
end

# Class for storing an entire linked-list
class LinkedList
  def initialize
    @head = Node.new
  end

  attr_reader :head

  def append(value)
    if @head.value.nil?
      @head.value = value
      return
    end
    tail.next_node = Node.new(value)
  end

  def prepend(value)
    if @head.value.nil?
      @head.value = value
      return
    end
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def tail
    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  def to_s
    text = @head.value.nil? ? '' : "( #{@head.value} ) -> "
    current_node = @head

    until current_node.next_node.nil?
      text << "( #{current_node.next_node.value} ) -> "
      current_node = current_node.next_node
    end
    text << 'nil'
  end
end

test = LinkedList.new
test.append('3')
test.append(2)
test.append(1)
puts test.to_s
