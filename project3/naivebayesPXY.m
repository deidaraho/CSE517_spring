function [posprob,negprob] = naivebayesPXY(x,y)
% function [posprob,negprob] = naivebayesPXY(x,y);
%
% Computation of P(X|Y)
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1) (1xn)
%
% Output:
% posprob: probability vector of p(x|y=1) (dx1)
% negprob: probability vector of p(x|y=-1) (dx1)
%

% add one all-ones positive and negative example
[d,n]=size(x);
x=[x ones(d,2)];
y=[y -1 1];

[d,n] = size(x);
%% fill in code here
pos_y = double( y == +1 );
neg_y = double( y == -1 );

sum_x = sum( x, 1 );
pos_len = dot( pos_y, sum_x );
neg_len = dot( neg_y, sum_x );

posprob = x * pos_y';
negprob = x * neg_y';
posprob = posprob / pos_len;
negprob = negprob / neg_len;