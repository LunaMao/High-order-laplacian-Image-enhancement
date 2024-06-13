function X_new = img_normalize(X)
% [i,j]
% Shape_x = size(X);

% for nc = 1:Shape_x(1)
    max_value = max(max(X(:,:)));
    min_value = min(min(X(:,:)));
    X_new(:,:) = (X(:,:)-min_value)/(max_value-min_value);
% end
