class LinkedList
  attr_accessor :name
  def initialize
    @head = nil
    @tail = nil
    @count = 0
  end

  def append(value)
    node = Node.new(value, @count)
    @count += 1
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_addr = node
      @tail = node
    end
  end

  def prepend(value)
    node = Node.new(value, @count)
    @count += 1
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_addr = @head
      @head = node
    end
  end

  def size
    @count
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    current_node = @head
    index.times do
      current_node = current_node.next
    end
    return current_node
  end

  def pop
    current_node = @head
    until current_node.next_addr == nil
      new_tail = current_node
      current_node = current_node.next
    end
    current_node = nil
    @tail = new_tail
    @tail.next_addr = nil
  end

  def contains?(value)
    current_node = @head
    @count.times do 
      if current_node == nil
        return false
      end
      if current_node.value == value
        return true
      end
      current_node = current_node.next
    end
  end

  def find(value)
    current_node = @head
    @count.times do |i|
      if current_node == nil
        return false
      end
      if current_node.value == value
        return i
      end
      current_node = current_node.next
    end
  end

  def to_s
    current_node = @head
    @count.times do
      unless current_node == nil
        print "( #{current_node.value} ) - > " 
        current_node = current_node.next
      else
        print "nil \n"
      end
    end
  end
end

class Node
  attr_accessor :value, :next_addr, :index
  def initialize(value = nil, index)
    @value = value
    @next_addr = nil
    @index = index
  end

  def next
    @next_addr
  end
end

list = LinkedList.new
list.append("a")
list.append("b")
# list.prepend("prep")
list.append("c")
list.append("d")
list.append("e")
list.append("f")
list.append("g")
head = list.head
p "Head value: #{head.value}"
tail = list.tail
p "Tail value: #{tail.value}"
list.pop
tail = list.tail
p "Tail next addr after pop: #{tail.next_addr}"
p "Tail val after pop: #{tail.value}"
p list.contains?("g")
p list.find("a")
list.to_s