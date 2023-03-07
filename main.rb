# Binary Tree Traversal - Preorder, Inorder, Postorder

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

# Function to visit nodes in Preorder
def preorder(root)
  # base condition for recursion
  # if tree/sub-tree is empty, return and exit
  return if root.nil?
  
  print "#{root.data} " # Print data
  preorder(root.left) # Visit left subtree
  preorder(root.right) # Visit right subtree
end

# Function to visit nodes in Inorder
def inorder(root)
  return if root.nil?

  inorder(root.left) # Visit left subtree
  print "#{root.data} " # Print data
  inorder(root.right) # Visit right subtree
end

# Function to visit nodes in Postorder
def postorder(root)
  return if root.nil?

  postorder(root.left) # Visit left subtree
  postorder(root.right) # Visit right subtree
  print "#{root.data} " # Print data
end

# Function to Insert Node in a Binary Search Tree
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

def build_tree(array)
  root = nil
  array.each do |data|
    root = insert(root, data)
  end
  root
end

def print_tree(root, prefix = "", is_left = true)
  return if root.nil?
  print_tree(root.right, "#{prefix}#{is_left ? "│ " : " "}", false)
  puts "#{prefix}#{is_left ? "└─" : "┌─"}#{root.data}"
  print_tree(root.left, "#{prefix}#{is_left ? " " : "│ "}", true)
end

# Code To Test the logic
# Creating an example tree
#                 M
#                / \
#               B   Q
#              / \   \
#             A   C   Z


root = build_tree(['M', 'B', 'Q', 'Z', 'A', 'C'])
print_tree(root)

# Print Nodes in Preorder.
print "Preorder: "
preorder(root)
puts
# Print Nodes in Inorder
print "Inorder: "
inorder(root)
puts
# Print Nodes in Postorder
print "Postorder: "
postorder(root)
puts