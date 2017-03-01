function newZetas = dataAssignmentKernel(zetas,data,sigma)

k = size(zetas,2);
sizeOFclusters = sum(zetas);
dim1 = size(data,1);
kernelsValues = zeros(dim1);
distances = zeros(dim1,k);
newZetas = zeros(dim1,k);

for i=1:dim1
  for j = i:dim1
    kernelsValues(i,j) = rbfKernel(data(i,:),data(j,:),sigma);
    kernelsValues(j,i) = kernelsValues(i,j);
  end
end

for i = 1:k
    currentZetas = zetas(:,i);
    zetasTimesZetas = currentZetas*currentZetas';
    sumSecond = zetasTimesZetas.*kernelsValues;
    sumSecond = sum(sum(sumSecond))/(sizeOFclusters(i)^2);
    for j = 1:dim1
       sumFirst = (-2/sizeOFclusters(i))*(currentZetas'*kernelsValues(j,:)');
       distances(j,i) = kernelsValues(j,j) + sumFirst + sumSecond;
    end
end

for i=1:dim1
newZetas(i,distances(i,:)==min(distances(i,:))) = 1;
end

