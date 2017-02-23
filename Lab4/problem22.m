clear all; close all; clc;
load d2.mat;
k = 5;
%kernel_functions = {'linear', 'quadratic', 'rbf'};
kernel_functions = {'rbf'};
errors = zeros(3,2);
times = zeros(3,2);

for i = 1:size(kernel_functions)
    [errors(i,1), times(i,1)] = kFoldAccuracyTime(X, Y, k, kernel_functions{i}, 'QP');
    [errors(i,2), times(i,2)] = kFoldAccuracyTime(X, Y, k, kernel_functions{i}, 'SMO');
end

%% 
load d2.mat;
k = 5;
i = 1;
classError = 0;
%for i=1:5
    binsize = size(X,1) / k;
    
xtrain = X(1:(k-1)*binsize,:);
ytrain = Y(1:(k-1)*binsize,:);

svmStruct = svmtrain(xtrain,ytrain,'ShowPlot',true, 'boxconstraint', 1.0, 'kernel_function', 'rbf', 'method', 'SMO');

xtest = X((k-1)*binsize + 1 : size(X,1),:);
ytest = Y((k-1)*binsize + 1 : size(Y,1),:);

species = svmclassify(svmStruct,xtest,'ShowPlot',true);
find(species - ytest == 0)
classError = classError + size(find(species - ytest ~= 0),1)/size(species,1);
X = circshift(X,binsize,1);
Y = circshift(Y,binsize,1);

%end

classError  = classError / k;
%svmStructlin = svmtrain(X,Y,'ShowPlot',true, 'boxconstraint', 0.5, 'kernel_function', 'linear', 'method', 'SMO');

