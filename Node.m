classdef Node
    %A node, like ones in a singly linked list
    
    properties
        next
        value
    end
    
    methods
        function node = Node(val)
            %Contructs a simple node
            node.value = val;
            node.next = [];
        end
    end
end

