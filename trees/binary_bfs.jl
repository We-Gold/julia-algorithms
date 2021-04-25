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
    bfs(root::BinaryTreeNode)::Vector{BinaryTreeNode}

Performs a level order traversal (aka breadth first search) of a given binary tree.
"""
function bfs(root::BinaryTreeNode)::Vector{BinaryTreeNode}
    visited = []

    queue = [root]

    while !isempty(queue)
        # Get and remove the first node from the queue
        node = popfirst!(queue)

        # Visit this node
        push!(visited, node)

        # Enqueue the the left child of this node
        if(!isequal(node.leftchild, nothing))
            push!(queue, node.leftchild)
        end

        # Enqueue the the right child of this node
        if(!isequal(node.rightchild, nothing))
            push!(queue, node.rightchild)
        end
    end

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

@time traversal = bfs(nodes[1])

for node in traversal
    print("$(node.data) ")
end