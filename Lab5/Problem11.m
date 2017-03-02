%% Production of plots for Problem 1.1

clear all; close all; clc;
load hw5_p1a.mat;

k=2;
[zetas2, zetasFinal] = kMeansLinearKernel(X,k);

plot2AndEnd(zetas2,zetasFinal,X,k,1);

load hw5_p1b.mat;
[zetas2, zetasFinal] = kMeansLinearKernel(X,k);
plotClasses(zetasFinal,X,k,3);


load hw5_p1b.mat;
k = 2;
sigma = 0.2;

zetaFinal = kMeansRBFkernel(X,k,sigma);
plotClasses(zetaFinal,X,k,4);
