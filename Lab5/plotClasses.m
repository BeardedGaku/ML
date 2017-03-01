function plotClasses(zeta,X,k,index)
dim1 = size(X,1);
cdata = zeros(dim1,3);
x1 = X(:,1);
x2 = X(:,2);
colors = zeros(k,3);
colors(1,:) = [1 0 0];
colors(2,:) = [0 0 1];

lins = zeta*linspace(1,k,k)';

figure(index);
%scatter(x1,x2,20,cdata);
gscatter(x1,x2,lins);
