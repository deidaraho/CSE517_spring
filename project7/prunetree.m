function T=prunetree(T,xTe,y)
% function T=prunetree(T,xTe,y)
%
% Prunes a tree to minimal size such that performance on data xTe,y does not
% suffer.
%
% Input:
% T = tree
% xTe = validation data x (dxn matrix)
% y = labels (1xn matrix)
%
% Output:
% T = pruned tree
%

%% fill in code here
yP_bf = evaltree( T,xTe );
eval_bf = sum( yP_bf == y );

pruned = 0;
p_num = 1;

[ ~, Tr ] = size( T ); 
while 1
    ind_lv = find( T( 4,: ) == 0 );
    for i = 1:length( ind_lv )
        T_tmp = T;
        if ind_lv > 1
            son_l = T_tmp( 4, T( 6, ind_lv( i ) ) );
            son_r = T_tmp( 5, T( 6, ind_lv( i ) ) );
        
            T_tmp( 4:5, T( 6, ind_lv( i ) ) ) = 0;
            yP_af = evaltree( T_tmp, xTe );
            eval_af = sum( yP_af == y );
        
            if eval_af > eval_bf
                pruned = 1;
                prune( 1, p_num ) = T( 6, ind_lv( i ) );
                prune( 2, p_num ) = ind_lv( i );
                p_num = p_num + 1;
            else
                T_tmp( 4, T( 6, ind_lv( i ) ) ) = son_l;
                T_tmp( 5, T( 6, ind_lv( i ) ) ) = son_r;
            end
        end
    end
    
    if pruned > 0
        T( 4, unique( prune( 1,: ) ) ) = 0;
        T( 5, unique( prune( 1,: ) ) ) = 0;
        T( :, prune( 2,: ) ) = -1;
        
        yP_bf = evaltree( T, xTe );
        eval_bf = sum( yP_bf == y );
        
        p_num = 1;
        pruned = 0;
        prune = [];
    else
        break;
    end
   
    
    
    
end