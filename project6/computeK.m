function K = computeK(kernel_type, X, Z, param)
% function K = computeK(kernel_type, X, Z)
% computes a matrix K such that Kij=g(x,z);
% for three different function linear, rbf or polynomial.
%
% Input:
% kernel_type: either 'linear','polynomial','rbf'
% X: n input vectors of dimension d (dxn);
% Z: m input vectors of dimension d (dxn);
% param: kernel parameter (inverse kernel width gamma in case of RBF, degree in case of polynomial)
%
% OUTPUT:
% K : nxm kernel matrix
%
%

if nargin<2,
	Z=X;
end;

%%YOUR CODE HERE
switch kernel_type
    case 'linear' 
        K = X'*Z;
    case 'rbf'    
        K = exp(-param*l2distance(X,Z).^2);
    case 'poly'
        K = (X'*Z+1).^param;
end