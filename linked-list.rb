# Class used by linked_list to store individual nodes
class Node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# Class for storing an entire linked-list
class LinkedList
  def initialize
    @head = nil
  end
end
