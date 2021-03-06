function ybar=computeybar(xTe)
% function [ybar]=ybar(xTe);
% 
% computes the expected label 'ybar' for a set of inputs x
% generated from two standard Normal distributions (one offset by OFFSET in
% both dimensions.)
%
% INPUT:
% xTe | a 2xn matrix of column input vectors
% 
% OUTPUT:
% ybar | a 1xn vector of the expected label ybare(x)
%

global OFFSET;

% [~,n]=size(xTe);
% ybar=zeros(1,n);

% Feel free to use the following function to compute p(x|y)
normpdf=@(x,mu,sigma)   exp(-0.5 * ((x - mu)./sigma).^2) ./ (sqrt(2*pi) .* sigma);

pdf_tmp = normpdf( xTe, 0, 1 );
pdf_xy1 = pdf_tmp( 1,: ) .* pdf_tmp( 2,: );
pdf_tmp = normpdf( xTe, OFFSET, 1 );
pdf_xy2 = pdf_tmp( 1,: ) .* pdf_tmp( 2,: );

ybar = ( 1*pdf_xy1 + 2*pdf_xy2 ) ./ ( pdf_xy1 + pdf_xy2 );

