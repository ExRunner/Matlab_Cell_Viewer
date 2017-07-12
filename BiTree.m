classdef BiTree

    
    properties
        head = 0
        depth
    end
    
    methods
        function tree = createBiTree(node)
            if nargin == 1
                tree.head = node;
                tree.depth = 1;
            elseif nargin == 0 
                tree.depth = 0;
            end
        end
    end
end

