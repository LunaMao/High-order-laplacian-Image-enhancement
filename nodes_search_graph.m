function [nodes_count,nodes]=nodes_search_graph(A)

% Input
% A: 4*4
% could be extend to n*n

ShapeA = size(A);
n = ShapeA(1);

nodes = [];
nodes_count = n;

% Trace all the connected nodes

for i = 1:n
    nodes = [nodes;i];
    Weight_sum = sum(A(i,:))+sum(A(:,i));
    if Weight_sum == 0
        nodes_count = nodes_count-1;
        nodes(nodes==i) = [];
    end

end