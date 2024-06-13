function eigenV = extract_v2_from_struction(X,ndim)

ShapeX = size(X);

eigenV = zeros(ShapeX(1),ShapeX(2),ndim);


for ii = 1:ShapeX(1)
    for jj = 1: ShapeX(2)
         % sprintf('%d x and %d ',ii,jj)
         D = X(ii,jj).eigenvalues_2nd;
         
         if size(D,1) ==ndim
             for k = 1:ndim
                eigenV(ii,jj,k) = D(k,k);
             end
         else
              for k = 1:size(D,1)
                eigenV(ii,jj,k) = D(k,k);
              end
              for k = size(D,1)+1:ndim
                eigenV(ii,jj,k) = D(size(D,1),size(D,1));
              end  
         end

    end
end
