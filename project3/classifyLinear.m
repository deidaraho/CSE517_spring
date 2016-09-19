function preds = classifyLinear(x,w,b);
% function preds=classifyLinear(x,w,b);
%
% Make predictions with a linear classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% w : weight vector
% b : bias
%
% Output:
% preds: predictions
%

%% fill in code here
if nargin<3
    b = 0;
end

h = x'*w + b;
preds = sign( h )';