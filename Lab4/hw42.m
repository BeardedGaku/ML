clear all; close all; clc;
load d1b.mat;

% ---Calculations----------------------------
% Training the svm, and findng the missclassified points
svmStruct = svmtrain(X,Y,'boxconstraint',1,'showplot', false, 'autoscale',false);
species = svmclassify(svmStruct, X);

% Calulating the hyperplane
svi = svmStruct.SupportVectorIndices;
w1 = dot(svmStruct.Alpha, X(svi,1));
w2 = dot(svmStruct.Alpha, X(svi,2));
bias = svmStruct.Bias;
f = @(x)-(w1/w2)*x-bias/w2;

% Calculating the soft margin
softmargin = 2/sqrt(w1*w1+w2*w2);

%---Plotting---------------------------------
fig = figure; hold on;
% Plotting the points
gscatter(X(:,1),X(:,2),Y,'br','x',7);

% Marking the misscalculated points
scatter(X(Y~=species,1),X(Y~=species,2),80,'go');

% Marking the support vectors
scatter(X(svi,1),X(svi,2),40,'k+');

% Plotting the hyperplane
x = linspace(min(X(:,1)),max(X(:,1)),1000);
plot(x,f(x),'k');

% Adding legend
legend('Y = 1','Y = -1','missclassified','support vector','hyperplane');

saveas(fig,'hw4-2-1.png');
%saveas(fig,'hw4-2-2.png');
hold off;