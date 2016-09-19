function [ypredict]=evaltree(T,xTe)
% function [ypredict]=evaltree(T,xTe);
%
% input:
% T0  | tree structure
% xTe | Test data (dxn matrix)
%
% output:
%
% ypredict : predictions of labels for xTe
%

%% fill in code here
[ ~, num ] = size( xTe );
ypredict = zeros( 1,num );
for i=1:num
    % each testing points
    par = 0;
    son = 1;
    while 1
        par = son;
        if T( 4, par ) == 0.0
            if T( 5, par ) == 0.0
                break;
            end
        end
        feature_tmp = T( 2, par );
        thre_tmp = T( 3, par );
        if xTe( feature_tmp, i ) > thre_tmp
            son = T( 5, par );
        else
            son = T( 4, par );
        end;
    end;
    ypredict( i ) = T( 1, par );
end
