clear all; close all; clc;
load d1b.mat;
P = cvpartition(Y,'Holdout',0.20);


cf = @(x)([(x==1) 0 (x==-1)]);
col = table2array(rowfun(cf,table(Y)));

svmStruct = svmtrain(X,Y,'boxconstraint',3,'showplot', true, 'autoscale',false);

figure; hold on;
scatter(X(:,1),X(:,2),40,col);

svi = svmStruct.SupportVectorIndices;
scatter(X(svi,1),X(svi,2),40,'k+');

w1 = dot(svmStruct.Alpha, X(svi,1));
w2 = dot(svmStruct.Alpha, X(svi,2));
bias = svmStruct.Bias;
f = @(x)-(w1/w2)*x-bias/w2;

x = linspace(min(X(:,1)),max(X(:,1)),1000);
plot(x,f(x),'k');
%%
svm = fitcsvm(X,Y,'CrossVal','off');
CVSVMModel = crossval(svm);