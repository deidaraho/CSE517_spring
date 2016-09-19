function preds=knnclassifier(xTr,yTr,xTe,k) 
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%


% output random result as default (you can erase this code)
[~,n]=size(xTe);
[~,ntr]=size(xTr);
if k>ntr,k=ntr;end;

%% fill in code here
D = l2distance( xTe,xTr );
%% [ ~, Ir ] = sort( D, 1, 'descend' );
for i = 1:n
    [ ~, Ir ] = sort( D(i,:), 2, 'ascend' );
    [ y_p, ~, c_p ] = mode( yTr( Ir( 1:k ) ) );
    if size( c_p{1},1 )>1
        tmp_k = k;
        while size( c_p{1},1 ) > 1
            tmp_k = tmp_k-1;
            [ y_p, ~, c_p ] = mode( yTr( Ir( 1:tmp_k) ) );
        end
    end
    preds( i ) = y_p;
end