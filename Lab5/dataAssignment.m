function zeta = dataAssignment(centroids,data)
k = size(centroids,1);
dim1 = size(data,1);

distances = zeros(dim1,k);
zeta = zeros(dim1,k);
 for j=1:dim1
    for i=1:k
      dist = sum((data(j,:) - centroids(i,:)).^2);
      distances(j,i) = dist;
   end
   ind = find(distances(j,:)==min(distances(j,:)));
   zeta(j,ind) = 1;
end
