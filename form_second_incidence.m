function [uw_B2,w_B2] = form_second_incidence(edges,num_edges,tris,num_tris)

uw_B2 = zeros(num_edges,num_tris);
w_B2 = zeros(num_edges,num_tris);

for ii = 1: num_edges
    for jj = 1: num_tris
        v = [edges(ii).i  edges(ii).j];
        t = tris(jj,:);
        

       % make sure the two elements [x,y] could be found in t[i,j,k]
       % if so, increase order --> +1
       % if not, decrease order --> -1

       if max(ismember(t,v(1)))&& max(ismember(t,v(2)))
           
           if v(1)<v(2)
               uw_B2(ii,jj)=1;
           else
               uw_B2(ii,jj)=-1;
           end

       else
            uw_B2(ii,jj)=0;
       end

        w_B2(ii,jj)=uw_B2(ii,jj)*abs(edges(ii).weigh);

    end
end
