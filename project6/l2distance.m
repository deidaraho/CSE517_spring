function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

if (nargin==1) % case when there is only one input (X)
	%% fill in code here
    n = size(X,2); % number of input vectors in X
    
    % Method 1: Faster
%     A = ones(n,1)*sum(X.^2);
%     A1 = ones(n,1)*sum(X.^2);
%     A2 = sum(X.^2)'*ones(1,n);
% %     A = repmat(sum(X.^2),[n,1]);
%     C = A+A'-(X'*X)*2;
%     C(C<0) = 0; 
    % Method 2: More elegant
    E = X'*X;%innerproduct(X);%
%     F = diag(E);
    A1 = ones(n,1)*diag(E)';
    A2 = diag(E)*ones(1,n);
%     A1 = repmat(diag(E),[1,n]);
%     A2 = repmat(diag(E)',[n,1]);
%     A = repmat(diag(X'*X),[1,n]);
%     C = A1+A2-E*2;
%     C(C<0) = 0; 
    
	D = sqrt(A1+A2-E*2);
%     fprintf('Invalid input. Please provide two sets of vectors!\n');
%     return;
else  % case when there are two inputs (X,Z)
	%% fill in code here
    n = size(X,2); % number of input vectors in X
    m = size(Z,2); % number of input vectors in Z
    
    % (x-z)^2 = x^2+z^2-2xz
    % Method 1: Faster
    A = sum(X.^2,1)'*ones(1,m);
    B = ones(n,1)*sum(Z.^2,1);
%     A = repmat(sum(X.^2),[m,1]); % or sum(X.^2) --> diag(X'*X)
%     B = repmat(sum(Z.^2),[n,1]);
    C = A+B-2*X'*Z;
    C(C<0) = 0;
    % Method 2: More elegant
%     A = repmat(diag(X'*X),[1,m]); % or sum(X.^2) --> diag(X'*X)
%     B = repmat(diag(Z'*Z),[1,n]);
%     C = A+B'-2*X'*Z;
    
	D = sqrt(C);

end;
%



