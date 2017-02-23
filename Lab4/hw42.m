clear all; close all; clc;
load d1b.mat;
P = cvpartition(Y,'Holdout',0.20);


cf = @(x)([(x==1) 0 (x==-1)]);
cf2 = @(x)([(x==1) 1 (x==-1)]);
col = table2array(rowfun(cf,table(Y)));

svmStruct = svmtrain(X,Y,'boxconstraint',1,'showplot', false, 'autoscale',false);

figure; hold on;
scatter(X(:,1),X(:,2),40,col);

species = svmclassify(svmStruct, X);
col2 = cf2(X(Y~=species));
scatter(X(Y~=species,1),X(Y~=species,2),100,col2);

svi = svmStruct.SupportVectorIndices;
scatter(X(svi,1),X(svi,2),40,'k+');

w1 = dot(svmStruct.Alpha, X(svi,1));
w2 = dot(svmStruct.Alpha, X(svi,2));
bias = svmStruct.Bias;
f = @(x)-(w1/w2)*x-bias/w2;

x = linspace(min(X(:,1)),max(X(:,1)),1000);
plot(x,f(x),'k');

softmargin = 2/sqrt(w1*w1+w2*w2);
%%
svm = fitcsvm(X,Y,'CrossVal','off');
CVSVMModel = crossval(svm);