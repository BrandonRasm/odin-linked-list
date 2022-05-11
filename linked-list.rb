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

  def size
    return 0 if @head.value.nil?

    num = 1
    current_node = @head
    until current_node.next_node.nil?
      num += 1
      current_node = current_node.next_node
    end
    num
  end

  def at(index)
    return if @head.value.nil?
    return if index > size - 1

    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    return if @head.value.nil?

    if @head == tail # checks if list has only 1 element
      popped_node = @head
      @head = Node.new
      return popped_node
    end

    current_node = @head
    current_node = current_node.next_node until current_node.next_node == tail

    popped_node = current_node.next_node
    current_node.next_node = nil
    popped_node
  end

  def contains?(value)
    return false if @head.value.nil?
    return value == @head.value if @head == tail

    current_node = @head
    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    return if @head.value.nil?

    current_node = @head
    (0..size).each do |i|
      return i if current_node.value == value

      current_node = current_node.next_node
    end
    nil
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

  def insert_at(value, index)
    return append(value) if index > size - 1
    return prepend(value) if index.zero?

    left = at(index - 1)
    right = left.next_node

    left.next_node = Node.new(value, right)
  end

  def remove_at(index)
    return if @head.value.nil?
    return pop if index > size - 1
    return @head = @head.next_node if index <= 0

    left = at(index - 1)
    left.next_node = left.next_node.next_node
  end
end

test = LinkedList.new
puts test.size
test.append('3')
test.append(2)
test.append(1)
puts test.to_s
test.prepend(4)
puts test.to_s
test.append(5)
puts test.to_s
test.remove_at(-11)
puts test.to_s
