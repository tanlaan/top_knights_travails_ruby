def knight_moves(start_position, end_position)
    #Build the tree
    #Search the tree
    #Give response
    #End
end

class KnightMoveList
    attr_reader(:root)

    def initialize(start_position)
        @root = build_graph(start_position)
    end

    def build_graph(start_position)

    end
end

class Node
    attr_reader(:value, :children)

    def initialize(position)
        @value = position
        @children = []
    end

    def insert_child(position)
        # Create node from position
        # Add node to children
        # Return node
        new_node = Node.new(position)
        @children.append(new_node)
        new_node
    end

    # Not sure we would really need this
    def remove_child(position)
        @children.delete_if {|child| child.value == position}
    end

    # Check if Node is a leaf
    def children?
        return false if @children.length == 0
    end
end