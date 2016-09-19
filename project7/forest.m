function F=forest(x,y,nt)
% function F=forest(x,y,nt)
%
% INPUT:
% x | input vectors dxn
% y | input labels 1xn
%
% OUTPUT:
% F | Forest
%

%% fill in code here
[ ~, num_sample ] = size( x );
% total_indx = 1:num_sample;
for i = 1:nt
   bag_indx = randsample( num_sample, num_sample, 1 );
   val_indx = 1:num_sample;
   val_indx( unique( bag_indx ) ) = [];
   
   xTe = x( :, bag_indx );
   yTe = y( bag_indx );
   xVa = x( :, val_indx );
   yVa = y( val_indx );
   
   T_tmp = id3tree( xTe, yTe );
   T_tmp = prunetree( T_tmp, xVa, yVa );
   
   F{i} = T_tmp; 
end
