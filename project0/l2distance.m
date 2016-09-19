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
s_v = sum( X.^2 ); % norm vector, (1,x_r)
if (nargin==1) % case when there is only one input (X)
    Z = X;
end
%% fill in code here
Xz = -X'*Z;
r_v = sum( Z.^2 ); % Z vector norm, (1,z_r)
D = bsxfun( @plus, bsxfun( @plus, 2*Xz, s_v' ), r_v );
D = max( D, 0 );
D = sqrt( D );

end

%



