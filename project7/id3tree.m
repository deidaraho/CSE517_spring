function T=id3tree( xTr,yTr,maxdepth,weights )
% function T=id3tree(xTr,yTr,maxdepth,weights)
%
% The maximum tree depth is defined by "maxdepth" (maxdepth=2 means one split).
% Each example can be weighted with "weights".
%
% Builds an id3 tree
%
% Input:
% xTr | dxn input matrix with n column-vectors of dimensionality d
% yTr | 1xn input matrix
% maxdepth = maximum tree depth
% weights = 1xn vector where weights(i) is the weight of example i
%
% Output:
% T = decision tree
%

%% fill in code here
if nargin < 3
    weights = ones( size( yTr ) ) ./ length( yTr );
    maxdepth = Inf;
end;
if nargin < 4
    weights = ones( size( yTr ) ) ./ length( yTr );
end;

T1 = zeros( 6,1 );
T1( 1 ) = mode( yTr );
if range( yTr ) == 0
   T = T1;
elseif all( range( xTr, 2 ) == 0 )
    T = T1;
elseif maxdepth == 1
    T = T1;
else
    [ feature,cut,Hbest ]=entropysplit( xTr, yTr, weights );
    T1( 2 ) = feature;
    T1( 3 ) = cut;
    Idx_l = find( xTr( feature,: ) <= cut );
    Idx_r = find( xTr( feature,: ) > cut );
    Tl = id3tree( xTr( :,Idx_l ), yTr( Idx_l ), maxdepth-1, weights( Idx_l ) );
    Tr = id3tree( xTr( :,Idx_r ), yTr( Idx_r ), maxdepth-1, weights( Idx_r ) );
    [ cl, rl ] = size( Tl );
    [ cr, rr ] = size( Tr );
    T1( 4 ) = 1 + 1;
    T1( 5 ) = 1 + rl + 1;
    % modify left tree matrix 
    tmp_ind = find( Tl( 4,: ) > 0 );
    Tl( 4,tmp_ind ) = 1 + Tl( 4,tmp_ind );
    tmp_ind = find( Tl( 5,: ) );
    Tl( 5,tmp_ind ) = 1 + Tl( 5,tmp_ind );
    Tl( 6,: ) = 1 + Tl( 6,: );
    % modify right tree matrix
    tmp_ind = find( Tr( 4,: ) > 0 );
    Tr( 4,tmp_ind ) = 1 + rl + Tr( 4,tmp_ind );
    tmp_ind = find( Tr( 5,: ) > 0 );
    Tr( 5,tmp_ind ) = 1 + rl + Tr( 5,tmp_ind );
    Tr( 6,: ) = 1 + rl + Tr( 6,: );
    Tr( 6,1 ) = 1; % first column connect to T1
    % merge T1, Tl, Tr
    T = zeros( 6, 1+rl+rr );
    T( :,1 ) = T1;
    T( :,2:rl+1 ) = Tl;
    T( :,rl+1+1:1+rl+rr ) = Tr;
end;
