clear all; close all; clc;
%Solution of problem 2.2.b
load d2.mat;

showPlots = false;
savePlots = false;

k = 5;
kernel_functions = {'linear', 'quadratic', 'rbf'};
errors = zeros(3,2);
times = zeros(3,2);

for i = 1:size(kernel_functions,2)
    [errors(i,1), times(i,1)] = kFoldAccuracyTime(X, Y, k, kernel_functions{i}, 'QP', showPlots, savePlots);
    [errors(i,2), times(i,2)] = kFoldAccuracyTime(X, Y, k, kernel_functions{i}, 'SMO', showPlots, savePlots);
end

%% 
%Solution of the problem 2.2.c
load d2.mat;
k = 5;
i = 1;
classError = 0;
%for i=1:5
binsize = size(X,1) / k;
    
xtrain = X(1:(k-1)*binsize,:);
ytrain = Y(1:(k-1)*binsize,:);

svmStruct = svmtrain(X,Y,'ShowPlot',true, 'boxconstraint', 1.0, 'autoscale', 'off', 'kernel_function', 'rbf', 'method', 'SMO');


epsilon = 0.05;
vectorlistx1 = [];
vectorlistx2 = [];
cdata = [];
x = [];
for r = 0.5:0.01:2
    for phi = 0:0.05:6.28 
   x = cat(1,x,[r*cos(phi), r*sin(phi)]);
    end
end
prediction = predictForClassification(svmStruct, x, 1);
indeces = find((-epsilon < prediction) & (prediction < epsilon));

cdata = zeros(size(indeces,1),1);

vectorlistx1 = cat(1,vectorlistx1,x(indeces,1));
vectorlistx2 = cat(1,vectorlistx2,x(indeces,2));

vectorlistx1 = cat(1,vectorlistx1,X(:,1));
vectorlistx2 = cat(1,vectorlistx2,X(:,2));
 
cf = @(x)([(x==1) 0 (x==-1)]);
col = table2array(rowfun(cf,table(Y)));
 
cdata = cat(1,cdata, Y);

figure;
gscatter(vectorlistx1,vectorlistx2,cdata,'bkr','+.x');
axes('x1','x2');
legend('Class 1', 'hyperplane', 'Class 2');


