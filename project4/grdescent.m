function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%

if nargin<5,tolerance=1e-02;end;

w = w0;
% step = stepsize;

for i=1:maxiter
    if i<4
        step = stepsize;
    end
    [loss,gradient]=func(w);
    if loss<=tolerance
        break;
    end
    w1 = w-step*gradient;
    [loss1,~]=func(w1);
    if loss1<loss
        while loss1<loss
          step = step*1.1;
          loss = loss1;
          w1 = w-step*gradient;
          [loss1,~]=func(w1);
        end
        step = step/1.1;
    else
        count = 0;
        while loss1>loss
          if count>30
              break;
          end
          step = step/2.0;
          w1 = w-step*gradient;
          [loss1,~]=func(w1);
          count = count+1;
        end
        loss = loss1;
    end
    w = w-step*gradient;
end
