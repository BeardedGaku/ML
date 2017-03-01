function clusters = clusterIdentification(idx,k)

clusters = cell(k,1);

for i = 1:k
    clusters{i}=find(idx==i);
end
