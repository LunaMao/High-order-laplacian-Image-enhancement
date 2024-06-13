function [tri_count,tri_nodes]=tri_search_graph(A)

% Input
% A: 4*4
% could be extend to n*n

ShapeA = size(A);
n = ShapeA(1);

tri_nodes = [];
tri_count = 0;

% Trace all the possible 3-points combinations

for ii = 1:n-2
    for jj=ii+1:n-1
        for kk=jj+1:n
            if (A(ii,jj)~=0)&&(A(jj,kk)~=0)&&(A(kk,ii)~=0)
                tri_count = tri_count + 1;
                tri_nodes = [tri_nodes; ii jj kk];
            end
        end
    end
end