function InsertNode( tree, targetdepth , parent )
if tree.depth+1 < targetdepth
    return;
end



end

classdef dlnode < handle
% DLNODE  A class to represent a doubly-linked list node.
% Multiple dlnode objects may be linked together to create linked listes.
% Each node contains a piece of data and provides access to the next
% and previous nodes.
   properties
      Data
   end
   properties(SetAccess = private)
      Next
      Prev
   end
    
   methods
      function node = dlnode(Data)
      % DLNODE  Constructs a dlnode object.
         if nargin > 0
            node.Data = Data;
         end
      end
      
      function insertAfter(newNode, nodeBefore)
      % insertAfter  Inserts newNode after nodeBefore.
         disconnect(newNode);
         newNode.Next = nodeBefore.Next;
         newNode.Prev = nodeBefore;
         if ~isempty(nodeBefore.Next)
            nodeBefore.Next.Prev = newNode;
         end
         nodeBefore.Next = newNode;
      end
      
      function insertBefore(newNode, nodeAfter)
      % insertBefore  Inserts newNode before nodeAfter.
         disconnect(newNode);
         newNode.Next = nodeAfter;
         newNode.Prev = nodeAfter.Prev;
         if ~isempty(nodeAfter.Prev)
             nodeAfter.Prev.Next = newNode;
         end
         nodeAfter.Prev = newNode;
      end

      function disconnect(node)
      % DISCONNECT  Removes a node from a linked list.  
      % The node can be reconnected or moved to a different list.
         Prev = node.Prev;
         Next = node.Next;
         if ~isempty(Prev)
             Prev.Next = Next;
         end
         if ~isempty(Next)
             Next.Prev = Prev;
         end
         node.Next = [];
         node.Prev = [];
      end
      
      function delete(node)
      % DELETE  Deletes a dlnode from a linked list.
         disconnect(node);
      end        
      function disp(node)
      % DISP  Displays a link node.
         disp('Doubly-linked list node with data:')
         disp(node.Data);
      end
   end % methods
end % classdef

    
    
%doubleLinkedList.m  链表类

classdef doubleLinkedList < handle
   properties (GetAccess = private, SetAccess = private)
      count = 0;
      current = [];
      currentpos = 0;
   end

   methods
       function list = doubleLinkedList()
           
       end
       
       function SetPosition(list, p)
           if (p < 0 || p >= list.count)
               error('In SetPosition: Attempt to set a position not in the list.');
           elseif(list.currentpos < p )
               while( list.currentpos ~= p)
                    list.currentpos = list.currentpos + 1;
                    list.current = list.current.Next;
               end
           elseif(list.currentpos > p)
               while( list.currentpos ~= p)
                   list.currentpos = list.currentpos - 1;
                   list.current = list.current.Prev;
               end
           end
       end
       
       function InsertList(list, p, dlnode)
           if (p < 0 || p > list.count)
               error('In InsertList: Attempt to set a position not in the list.');
           else
               if( list.count == 0)
                   list.current = dlnode;
                   list.currentpos = 0;
               elseif( p == list.count)
                   SetPosition(list, p-1);
                   insertAfter(dlnode, list.current)
               else
                   SetPosition(list, p);
                   insertBefore(dlnode, list.current);
               end
               list.current = dlnode;
               list.currentpos = p;
               list.count = list.count + 1;
           end
       end    
          
       function ClearList(list)
           list.count = 0;
           list.current = [];
           list.currentpos = 0;
       end
       
       function isEmpty = ListEmpty(list)
           isEmpty = (list.count == 0);
       end
       
       function size = ListSize(list)
           size = list.count;
       end
       
       function isFull = ListFull(list)
           isFull = 0;
       end
       
       function aNode = RetrieveList(list, p)
           SetPosition(list, p);
           aNode = list.current;
       end
       
       function aNode = DeleteList(list, p)
           SetPosition(list, p);
           aNode = list.current;
           toBeDeleted = list.current;
           if(list.count == 1)
                list.currentpos = 0;
                list.current = [];
           elseif( list.count-1 == p)
               list.current = list.current.Prev;
               list.currentpos = list.currentpos - 1;
           else
                list.current = list.current.Next;
           end
           disconnect(toBeDeleted);
           list.count = list.count - 1;
       end
       
       function aNode = ReplaceList(list, p, dlnode)
           SetPosition(list, p);
           toBeReplaced = list.current;
           insertBefore(dlnode, list.current);
           list.current = dlnode;
           disconnect(toBeReplaced);
           aNode = toBeReplaced;
       end
       
       function position = FindFirstInList(list, func)
           found = 0;
           for i = 0:list.count - 1
               SetPosition(list, i);
               if( func(list.current))
                   found = 1;
                   position = i;
                   break;
               end               
           end
           if( found == 0)
               position = list.count;
           end
       end
       
       function TraverseList(list, func)
           for i = 0:list.count - 1
               aNode = RetrieveList(list, i);
               func(aNode);
           end
       end
   end % methods
   
end % classdef




%创建5个节点
len = 5;
for i = 1:len
    node(i) = dlnode(i);
end

%创建链表，并向链表中插入节点
list = doubleLinkedList();
for i = 1:len
    InsertList(list, ListSize(list), node(i));
end

%查找链表中第一个符合要求元素的位置
pos = FindFirstInList(list, @isMoreThanOne)

%打印链表内容
TraverseList(list, @printNode);

%isMoreThanOne.m 和 printNode.m 是上面测试程序中用到的函数。
%isMoreThanOne.m检查一个node中的数据是否大于1

function val = isMoreThanOne(x)
    val = (x.Data > 1);
end 
%printNode.m打印一个节点

function printNode(aNode)
    aNode.Data
end