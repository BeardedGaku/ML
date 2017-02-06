clear all; close all;
%loading and observing the data
digits = load('digits.mat');
data = digits.data;

y = reshape(data(:, 45, 5), 16, 16);
figure;
imshow(y)

figure;
imshow(gradient(y))
%%
%question (a)
%data preparation
data5 = transpose(data(:,:,5));
data8 = transpose(data(:,:,8));

%% testing of the classifier
mdata5 = mean(data5,1);
mdata8 = mean(data8,1);

xtest = data(:, 85, 5);
xtest = transpose(xtest(:));

Ytest = new_classifier(xtest, mdata8, mdata5);
%% kfold validation error
avg_errorA = kFoldValidationNewClassifier(data5,data8,5);

%%
%question (b)
%data preparation
normalisedData = data/255;
reshapedNormData = reshape(normalisedData, 16, 16, 1100, 10);

sizes = size(reshapedNormData);

y = reshapedNormData(:, :, 45, 8);
imshow(y)

dataVar = zeros(sizes(1) + sizes(2),sizes(3),sizes(4));
dataVarAndMean = zeros(2*(sizes(1) + sizes(2)),sizes(3),sizes(4));

for i=1:sizes(3)
    for j=1:sizes(4)
  y = reshapedNormData(:, :, i, j);
          xvector = [];
          xvector = cat(2, xvector, var(y));
          xvector = cat(2, xvector, var(transpose(y)));
          dataVar(:,i,j) = xvector;
    end
end


data5 = transpose(dataVar(:,:,5));
data8 = transpose(dataVar(:,:,8));
%% testing of the classifier
mdata5 = mean(data5,1);
mdata8 = mean(data8,1);

xtest = dataVar(:, 1, 8);
xtest = transpose(xtest(:));

Ytestvar = new_classifier(xtest, mdata8, mdata5);
Yourtest = test_classifier(xtest, mdata8, mdata5);

%% kfold validation error


avg_errorB = kFoldValidationNewClassifier(data5,data8,5);
avg_errorO = kFoldValidationOurClassifier(data5,data8,5);
%% Attempt to improve the error

dataAndVar  = cat(1,normalisedData,dataVar);
data5 = transpose(dataAndVar(:,:,5));
data8 = transpose(dataAndVar(:,:,8));

avg_errorC = kFoldValidationNewClassifier(data5,data8,5);


