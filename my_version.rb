# This is my attempt to write pre-order, in-order, and post-order traversal code myself.

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
  else
    root.right = insert(root.right, data)
  end
  root
end

# Write the build_tree method

def build_tree(array)
  root = nil
  array.each do |el|
    root = insert(root, el)
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

# 1. visit root
# 2. visit left subtree
# 3. visit right subtree

def preorder(root)
  return if root.nil?
  print "#{root.data} "
  preorder(root.left)
  preorder(root.right)
end

# Write method for inorder traversal

# 1. visit left subtree
# 2. visit root
# 3. visit right subtree

def inorder(root)
  return if root.nil?
  inorder(root.left)
  print "#{root.data} "
  inorder(root.right)
end

# Write method for postorder traversal

def postorder(root)
  return if root.nil?
  inorder(root.left)
  inorder(root.right)
  print "#{root.data}"
end

root = build_tree(['M', 'B', 'Q', 'Z', 'A', 'C'])
print_tree(root)

print "Preorder:"
preorder(root)
puts
print "Inorder:"
inorder(root)
puts
print "Postorder:"
postorder(root)
puts