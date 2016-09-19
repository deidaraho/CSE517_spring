function [indices,dists]=findknn(xTr,xTe,k)
% function [indices,dists]=findknn(xTr,xTe,k);
%
% Finds the k nearest neighbors of xTe in xTr.
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
% 
% Output:
% indices = kxm matrix, where indices(i,j) is the i^th nearest neighbor of xTe(:,j)
% dists = Euclidean distances to the respective nearest neighbors
%

% output random results, please erase this code
[d,ntr]=size(xTr);
[d,nte]=size(xTe);
% indices=ceil(rand(k,nte)*ntr);
% dists=rand(k,nte);
if k>ntr,k=ntr;end;

%% fill in code here
% Preprocessing: PCA
% covariance = cov(xTr');
% [eigenvector, eigenvalue] = eig(covariance);
% eigen_thre = sum(sum(eigenvalue))*0.99;
% for i=1:d
%     eigen_thre = eigen_thre-eigenvalue(d-i+1,d-i+1);
%     if eigen_thre<0
%         index_thre = i;
%         break;
%     end
% end
% 
% PC = eigenvector(:,end-index_thre+1:end);
% 
% PCpointTr = zeros(index_thre,ntr);
% for i=1:ntr
%     for j=1:index_thre
%         PCpointTr(j,i) = xTr(:,i)'*PC(:,j);
%     end
% end
% PCpointTe = zeros(index_thre,nte);
% for i=1:nte
%     for j=1:index_thre
%         PCpointTe(j,i) = xTe(:,i)'*PC(:,j);
%     end
% end
% 
% zTr = [xTr;PCpointTr];%xTr;%PCpointTr;%
% zTe = [xTe;PCpointTe];%xTe;%PCpointTe;%

% Preprocessing: Normalization
% zTr = xTr./repmat(sqrt(sum(xTr.^2)),d,1);
% zTe = xTe./repmat(sqrt(sum(xTe.^2)),d,1);

% Preprocessing: fft
% zTr = abs(fft(xTr));
% zTe = abs(fft(xTe));

% No preprocessing
zTr = xTr;
zTe = xTe;

D = l2distance(zTr,zTe);
[D_rank, I_rank] = sort(D,1);

indices = I_rank(1:k,:);
dists = D_rank(1:k,:);
% D_rank = [1:ntr;sort(D,2)];


% for i = 0:9
%     ind = nonzeros((1:ntr).*(yTr==i));
%     eval(['num' num2str(i) ' = sum(ind>-1);']);
%     eval(['train' num2str(i) ' = zTr(:,ind);']);
% 	eval(['D' num2str(i) ' = l2distance(zTe,train' num2str(i) ');']);
% end
% 	
% D_rank = sort([D0,D1,D3,D4,D5,D6,D7,D8,D9],2);
% D_kNN = D_rank(:,1:k);
% 
% for i = 0:9
%     eval(['find' num2str(i) ' = D' num2str(i) '==repmat(D_kNN,1,num' num2str(i) ');']);
% end
%%	%
	
