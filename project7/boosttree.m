function BDT=boosttree(x,y,nt,maxdepth)
% function BDT=boosttree(x,y,nt,maxdepth)
%
% Learns a boosted decision tree on data x with labels y.
% It performs at most nt boosting iterations. Each decision tree has maximum depth "maxdepth".
%
% INPUT:
% x  | input vectors dxn
% y  | input labels 1xn
% nt | number of trees (default = 100)
% maxdepth | depth of each tree (default = 3)
%
% OUTPUT:
% BDT | Boosted DTree
%


%% fill in code here
if nargin < 4
    maxdepth = 3;
end
if nargin < 3
    nt = 20;
end

[ ~, nTr ] = size( x );
BDT_tmp = cell( 1, nt );

weights = ones( 1, nTr ) ./ nTr;

for i = 1:nt
    T_tmp = id3tree( x, y, maxdepth, weights );
    T_tmp = prunetree( T_tmp, x(:,2:2:end), y(:,2:2:end) );
    BDT_tmp{i} = T_tmp;
    
    y_pre = evaltree( T_tmp, x );
    del_y = ( y ~= y_pre ); % not correct, 0~equal, 1~not
    del_y = del_y + 0.0; % type transfer
    
    et = dot( weights, del_y );
    if et > 0.5
        break
    end
    
    at = 0.5 * log( ( 1 - et ) / et );
    del_y( find( del_y == 0.0 ) ) = -1;
    
%     w_norm = 1 / ( 2 * sqrt( et * ( 1 - et ) ) );
    weights = weights .* exp( at * del_y ); % update weigh, normlized
    w_norm = sum(weights);
    weights = weights / w_norm;
    
    alpha( i ) = at;
end

BDT{1} = alpha;
for j = 2:1:i
   BDT{j} = BDT_tmp{j-1}; 
end

end
