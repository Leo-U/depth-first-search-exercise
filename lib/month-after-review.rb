# This is my attempt to rewrite the preorder, inorder, and postorder traversal code as a review exercise (+1 month).

# Write the Node class
class Node
  attr_accessor :data, :left, :right
  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

# Write the insert method

def insert(root, data)
  if root.nil?
    root = Node.new(data)
  elsif data <= root.data
    root.left = insert(root.left, data)
  elsif data > root.data
    root.right = insert(root.right, data)
  end
  root
end


# Write the build_tree method

def build_tree(root, data_array)
  root = nil
  data_array.each do |data_element|
    root = insert(root, data_element)
  end
  root
end

# Copy that crazy print_tree method
def print_tree(root, prefix = "", is_left = true)
  return if root.nil?
  print_tree(root.right, "#{prefix}#{is_left ? "│ " : " "}", false)
  puts "#{prefix}#{is_left ? "└─" : "┌─"}#{root.data}"
  print_tree(root.left, "#{prefix}#{is_left ? " " : "│ "}", true)
end


# Write method for pre-order traversal

def pre_order(root)
  return if root.nil?
  print "#{root.data}"
  pre_order(root.left)
  pre_order(root.right)
end

# Write method for inorder traversal

def in_order(root)
  return if root.nil?
  in_order(root.left)
  print "#{root.data}"
  in_order(root.right)
end


# Write method for postorder traversal

def post_order(root)
  return if root.nil?
  post_order(root.left)
  post_order(root.right)
  print "#{root.data}"
end

# Run code
data_array = ['M', 'B', 'Q', 'Z', 'A', 'C']

root = build_tree(root, data_array)
print_tree(root)

puts 'pre-order:'
pre_order(root)
puts ''

puts 'in-order:'
in_order(root)
puts ''

puts 'post-order:'
post_order(root)
puts ''