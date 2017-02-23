function [classError, time] = kFoldAccuracyTime(X, Y, k, kernel_function, opt_method)

classError = 0;
t = cputime;
for i=1:5
    binsize = size(X,1) / k;
    
xtrain = X(1:(k-1)*binsize,:);
ytrain = Y(1:(k-1)*binsize,:);

figure(i);
svmStruct = svmtrain(xtrain,ytrain,'ShowPlot',true, 'boxconstraint', 1.0, 'kernel_function', kernel_function, 'method', opt_method);

xtest = X((k-1)*binsize + 1 : size(X,1),:);
ytest = Y((k-1)*binsize + 1 : size(Y,1),:);

species = svmclassify(svmStruct,xtest,'ShowPlot',true);

classError = classError + size(find(species - ytest ~= 0),1)/size(species,1);
X = circshift(X,binsize,1);
Y = circshift(Y,binsize,1);

end

time = cputime - t;

classError  = classError / k;
