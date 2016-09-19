function [poscond, negcond] = naivebayes(x,y,x1)
% function possi = naivebayes(x,y);
%
% Computation of log P(Y|X=x1) using Bayes Rule
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
% x1: input vector of d dimensions (dx1)
%
% Output:
% poscond: log conditional probability log P(Y = 1|X=x1)
% negcond: log conditional probability log P(Y = -1|X=x1)
%

[d,n] = size(x);
%% fill in code here
[ pos, neg ] = naivebayesPY(x,y);
[ posprob, negprob ] = naivebayesPXY(x,y);
log_posprob = log( posprob );
log_negprob = log( negprob );
poscond = log( pos ) + dot( log_posprob, x1 );
negcond = log( neg ) + dot( log_negprob, x1 );

