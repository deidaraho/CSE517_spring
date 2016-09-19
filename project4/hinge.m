function [loss,gradient,preds]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[ d, n ]=size(xTr);
loss = lambda * dot( w, w );
wTx = w' * xTr;
loss = loss + sum( max( 1 - yTr .* wTx, 0 ) );

gradient = 2 * lambda * w;
y_tmp = yTr; 
% x_tmp = xTr;
y_tmp( yTr .* wTx > 1 ) = 0;
% x_tmp( :, yTr .* wTr > 1) = 0;
gradient = gradient - xTr * y_tmp';


