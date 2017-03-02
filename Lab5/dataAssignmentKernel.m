function newZetas = dataAssignmentKernel(zetas,kernelsValues)

k = size(zetas,2);
sizeOFclusters = sum(zetas);
dim1 = size(kernelsValues,1);
distances = zeros(dim1,k);
newZetas = zeros(dim1,k);


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

