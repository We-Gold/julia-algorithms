mutable struct BinaryTreeNode
    data
    leftchild
    rightchild

    function BinaryTreeNode()
        return new(nothing, nothing, nothing)
    end

    function BinaryTreeNode(data; leftchild = nothing, rightchild = nothing) 
        return new(data, leftchild, rightchild)
    end
end

"""
    preorder_dfs(root)

Performs a preorder traversal of a given binary tree.
"""
function preorder_dfs(root::BinaryTreeNode)::Vector{BinaryTreeNode}
    visited = []

    # Visit this node
    push!(visited, root)

    # Traverse the left child's subtree, if this node has a left child
    if(!isequal(root.leftchild, nothing))
        push!(visited, preorder_dfs(root.leftchild)...)
    end

    # Traverse the right child's subtree, if this node has a right child
    if(!isequal(root.rightchild, nothing))
        push!(visited, preorder_dfs(root.rightchild)...)
    end

    return visited
end

"""
    inorder_dfs(root)

Performs an inorder traversal of a given binary tree.
"""
function inorder_dfs(root::BinaryTreeNode)::Vector{BinaryTreeNode}
    visited = []

    # Traverse the left child's subtree, if this node has a left child
    if(!isequal(root.leftchild, nothing))
        push!(visited, inorder_dfs(root.leftchild)...)
    end

    # Visit this node
    push!(visited, root)

    # Traverse the right child's subtree, if this node has a right child
    if(!isequal(root.rightchild, nothing))
        push!(visited, inorder_dfs(root.rightchild)...)
    end

    return visited
end

"""
    postorder_dfs(root)

Performs a postorder traversal of a given binary tree.
"""
function postorder_dfs(root::BinaryTreeNode)::Vector{BinaryTreeNode}
    visited = []

    # Traverse the left child's subtree, if this node has a left child
    if(!isequal(root.leftchild, nothing))
        push!(visited, postorder_dfs(root.leftchild)...)
    end

    # Traverse the right child's subtree, if this node has a right child
    if(!isequal(root.rightchild, nothing))
        push!(visited, postorder_dfs(root.rightchild)...)
    end

    # Visit this node
    push!(visited, root)

    return visited
end

######## TESTING ########
nodes = []

for i in 1:15
    push!(nodes, BinaryTreeNode(i))
end

# A simple binary tree
#         1
#      2     3
#    4   5 6   7
#   8 9
nodes[1].leftchild = nodes[2]
nodes[1].rightchild = nodes[3]
nodes[2].leftchild = nodes[4]
nodes[2].rightchild = nodes[5]
nodes[3].leftchild = nodes[6]
nodes[3].rightchild = nodes[7]
nodes[4].leftchild = nodes[8]
nodes[4].rightchild = nodes[9]

@time traversal = preorder_dfs(nodes[1])

for node in traversal
    print("$(node.data) ")
end