function eigenV = extract_v1_from_struction(X,ndim)

ShapeX = size(X);

eigenV = zeros(ShapeX(1),ShapeX(2),ndim);


for ii = 1:ShapeX(1)
    for jj = 1: ShapeX(2)
         D = X(ii,jj).eigenvalues_1st;
         
         for k = 1:ndim
            eigenV(ii,jj,k) = D(k,k);
         end

    end
end
