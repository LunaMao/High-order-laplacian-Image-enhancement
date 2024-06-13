function [uw_B1,w_B1] = form_first_incidence(nodes,num_nodes,edges,num_edges)

uw_B1 = zeros(num_nodes,num_edges);
w_B1 = zeros(num_nodes,num_edges);

for ii = 1: num_nodes
    for jj = 1: num_edges

        if nodes(ii) ==edges(jj).i
            uw_B1(ii,jj)=1;
        elseif nodes(ii) ==edges(jj).j
            uw_B1(ii,jj)=-1;
        else
            uw_B1(ii,jj)=0;
        end
        w_B1(ii,jj)=uw_B1(ii,jj)*abs(edges(jj).weigh);

    end
end


