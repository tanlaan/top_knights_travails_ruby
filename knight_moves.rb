def knight_moves(start_position, end_position)
    #Build the tree
    move_graph = KnightMoveList.new(start_position)
    #Search the tree
    # moves_required = move_graph.find(end_position)
    #Give response
    # p "You made it in #{moves_required.length} moves! Here's your path:"
    # for move in moves_required do
    #     p move
    # end
end

class KnightMoveList
    attr_reader(:root)

    KNIGHTMOVES = [
        [1,2],[1,-2],
        [2,1],[2,-1],
        [-1,2],[-1,-2],
        [-2,1],[-2,-2]
    ]

    def initialize(start_position)
        @root = build_graph(start_position)
    end

    def build_graph(start_position)
        # start_position must be [0-7,0-7] (on the board)
        root_node = Node.new(start_position)
        positions_travelled = []
        node_queue = [root_node]
        while node_queue.length > 0
            # Get current node off queue
            current_node = node_queue.slice!(0)
            # Add to positions travelled
            positions_travelled.append(current_node.value) 
            # For each potention KNIGHTMOVES
            for delta_x, delta_y in KNIGHTMOVES do
                # Get new position
                # If on board
                #   Create node from position
                #   Add node to current_node.children
                #   Add node to node_queue

                x, y = current_node.value
                new_position = [x + delta_x,y + delta_y] 
                if on_board?(new_position) && positions_travelled.none?(new_position)
                    child_node = current_node.insert_child(new_position)
                    node_queue.append(child_node)
                end
            end
        end
        root_node
    end

    def on_board?(position)
        x, y = position
        x >= 0 && x < 8 && y >= 0 && y < 8 
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