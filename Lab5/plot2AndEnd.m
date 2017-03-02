function plot2AndEnd(zeta2,zeta,X,k,index)
dim1 = size(X,1);
cdata = zeros(dim1,3);
x1 = X(:,1);
x2 = X(:,2);

lins = zeta*linspace(1,k,k)';

fig = figure(index); hold on;
gscatter(x1,x2,lins,'br','o');

x1vec = [];
x2vec = [];
for i=1:dim1
  if(sum(zeta2(i,:) ~= zeta(i,:))>0)
      x1vec = cat(1,x1vec,X(i,1));
      x2vec = cat(1,x2vec,X(i,2));
  end
end

scatter(x1vec,x2vec,40,'k+');

legend('Cluster 1', 'Cluster 2', 'Change of clusters since it. 2')

if (~exist('img')) mkdir('img'); end;
saveas(fig,'img/it2final.png');