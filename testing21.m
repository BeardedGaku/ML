clear all; close all;
data = load('dataset2.mat');
X = data.x;
Y = data.y;

figure;
scatter3(X(:,1),X(:,2),X(:,3))