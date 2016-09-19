function preds=evalboost(BDT,xTe)
% function preds=evalboost(BDT,xTe);
%
% Evaluates a boosted decision tree on a test set xTe.
%
% input:
% BDT | Boosted Decision Trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here

[ ~,m ] = size( xTe );
at = BDT{1};
t_num = length( BDT ) - 1;

for i = 1:m
    pred_t = zeros( 1, t_num );
    for j = 1:t_num 
       pred_t( j ) = evaltree( BDT{j+1}, xTe( :,i ) ); % current tree prediction      
    end
    v_maj = 0;
    for k = min( pred_t ):max( pred_t )
        v_tmp = sum( at( find( pred_t == k ) ) );
        if v_tmp > v_maj
           preds( i ) = k; % wighted vote
           v_maj = v_tmp;
        end
    end
        
end

% for i = 2:length( BDT )
%     BDT_tmp{i-1} = BDT{i};
% end
% preds = evalforest( BDT_tmp, xTe );

end
