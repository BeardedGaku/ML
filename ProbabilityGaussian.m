function prob = ProbabilityGaussian(xnew, mu, sigma)
%clear all; close all;
%data = load('dataset2.mat');
%X = data.x;
%Y = data.y;

%[mu1MLE sigma1MLE] = sge(X(find(Y==1),:));
%[mu2MLE sigma2MLE] = sge(X(find(Y==-1),:));

%xnew = [1 1 1];
%mu = mu1MLE;
%sigma= (sigma1MLE^2)*eye(3);
d=size(xnew,2);
xminusmu = xnew - mu;
expo = exp(-(1/(2*sigma^2))*xminusmu*transpose(xminusmu));
%mult = (1/(((2*3.14)^(d/2) * sigma^d)));

prob = (1/(((2*3.14)^(d/2) * sigma1MLE^d)))* expo;
%p2= mvnpdf(xnew,mu,sigma);
