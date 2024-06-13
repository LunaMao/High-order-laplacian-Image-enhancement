function [tetrahedron_count,tetrahedron_nodes]=tetrahedron_search_graph(A)

% Input
% A: 4*4
% could be extend to n*n

ShapeA = size(A);
n = ShapeA(1);

tetrahedron_nodes = [];
tetrahedron_count = 0;

% 
nodes = 1:n;
combinations = nchoosek(nodes,n);

for idx = 1:size(combinations,1)
    i = combinations(idx,1);
    j = combinations(idx,2);
    k = combinations(idx,3);
    l = combinations(idx,4);
    
    % Trace all the possible 4-points combinations

    if (A(i,j)~=0)&&(A(i,k)~=0)&&(A(i,l)~=0)&&...
       (A(j,i)~=0)&&(A(j,k)~=0)&&(A(j,l)~=0)&&... 
       (A(k,i)~=0)&&(A(k,j)~=0)&&(A(k,l)~=0)&&... 
       (A(l,i)~=0)&&(A(l,j)~=0)&&(A(l,k)~=0)
       
        tetrahedron_count = tetrahedron_count + 1;
        tetrahedron_nodes = [tetrahedron_nodes; i j k l];
    end

end





