function plot2AndEnd(zeta2,zeta,X,k,index)
dim1 = size(X,1);
cdata = zeros(dim1,3);
x1 = X(:,1);
x2 = X(:,2);
colors = zeros(k,3);
colors(1,:) = [1 0 0];
colors(2,:) = [0 0 1];

for i=1:dim1
cdata(i,:) = colors(zeta(i,:)== 1,:);
end

figure(index); hold on;
scatter(x1,x2,20,cdata);

x1vec = [];
x2vec = [];
for i=1:dim1
  if(sum(zeta2(i,:) ~= zeta(i,:))>0)
      x1vec = cat(1,x1vec,X(i,1));
      x2vec = cat(1,x2vec,X(i,2));
  end
end

scatter(x1vec,x2vec,40,'k+');