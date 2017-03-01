function centroids = randomCentroidInitialization(k, data)
dim1 = size(data,1);
dim2 = size(data,2);
r = randi([1,dim1],k,1);
centroids = zeros(k,dim2);
for i=1:k
centroids(i,:) = data(r(i),:);
end