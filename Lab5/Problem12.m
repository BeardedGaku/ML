clear all; close all; clc
load medium_100_10k.mat;

k=10;
[idx , C, sumd, D] = kmeans(wordembeddings,k);

tenClosestWordsIndexes = minimums(D,10);
charVocab = char(vocab);
closestWords = cellstr(charVocab(tenClosestWordsIndexes,:));
closestWords = reshape(closestWords,10,10);

%%
clear all; close all; clc
load medium_100_10k.mat;

k=10;
charVocab = char(vocab);
f = 0;

for j = 1: 10
[idx] = kmeans(wordembeddings,k, 'Replicates',1);
[~,indx]=ismember('cavalry',charVocab,'rows');
cluster = idx(indx);
cavaleryLike = find(idx==cluster);
sumCluster = sum(cavaleryLike);
n0 = (sumCluster * (sumCluster - 1))/2 ;

% kmeans
[idx] = kmeans(wordembeddings,k, 'Replicates',1);
newClusters = clusterIdentification(idx,k);
n1 = 0;

for i = 1:k
    sumCluster = sum(intersect(newClusters{i},cavaleryLike));
    n1 = n1+(sumCluster * (sumCluster - 1))/2 ;
end
disp(['iteration ' num2str(j) ' previous f= ' num2str(n1/n0)]);

f = f + n1/n0;
end

f = f /10;

%% question c
clear all; close all; clc
load medium_100_10k.mat;


perm = randperm(10000);
randomIndexes = perm(1:1000);
randomWords = wordembeddings(randomIndexes,:);
idx = kmeans(wordembeddings,10);
randomIdx = idx(randomIndexes);

ydata = tsne(randomWords, [], 2, 100, 30);

gscatter(ydata(:,1),ydata(:,2),randomIdx,'','+x',4)
