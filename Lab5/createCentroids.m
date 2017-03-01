function newCentroids = createCentroids(zeta,data)
sizeOfCluster = sum(zeta);
k = size(zeta,2);
dim2 = size(data,2);
newCentroids = zeros(k,dim2);

for j = 1:k
zetas = zeta(:,j);
newCentroids(j,:) = (zetas'*data)/sizeOfCluster(j);
end

