function w=perceptron(x,y)
% function w=perceptron(x,y);
%
% Implementation of a Perceptron classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
%

[d,n]=size(x);
% w=zeros(d+1,1);
% x=[x;ones(1,n)];
w = zeros(d,1);

%% fill in code here
for i=1:100
    indices = randperm(n);
    y = y(indices);
    x = x(:,indices);
    z = (x'*w).*y';
    if (sum(z<=0))==0
        break;
    end
    for j = 1:n
        if z(j)<=0
            w = perceptronUpdate(x(:,j),y(j),w);
        end
    end
end

w = w/sqrt(sum(w.^2));
% w = w(1:d);
