classdef Stack
    %A simple stack. Here it will only represent ints from the outside.
    
    properties
        beforeFirst
    end
    
    methods 
        function stack = Stack()
            %Creates an empty stack
            stack.beforeFirst = Node(-1);
        end
        function [obj, topVal] = pop(obj)
            %pops first element
            top = obj.beforeFirst.next;
            obj.beforeFirst.next = top.next;
            topVal = top.value;
        end
        function obj = push(obj, int)
            %pushes an int Node
            new = Node(int);
            new.next = obj.beforeFirst.next;
            obj.beforeFirst.next = new;
        end
        function bool = hasNext(obj)
           bool = ~isempty(obj.beforeFirst.next); 
        end
    end
end

