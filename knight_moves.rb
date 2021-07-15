class Node
    attr_reader(:root, :children)

    def initialize(posiiton)
        @root = position
        @children = []
    end

    def insert_child(position)
        @children.append(Node.new(position))
    end

    # Not sure we would really need this
    def remove_child(position)
        @children.delete_if {|child| child.root == position}
    end

    # Check if Node is a leaf
    def children?
        return false if @children.length == 0
    end
end