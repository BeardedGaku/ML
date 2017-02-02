function [mu, sigma] = sge(x)
%
% SGE Mean and variance estimator for spherical Gaussian distribution                               
%
% x     : Data matrix of size n x p where each row represents a 
%         p-dimensional data point e.g. 
%           x = [2 1;
%               3 7;
%                 4 5 ]; 
             %is a dataset having 3 samples each
%                 having two co-ordinates.
%
% mu    : Estimated mean of the dataset [mu_1 mu_2 ... mu_p] 
% sigma : Estimated standard deviation of the dataset (number)                 
%

%YOUR CODE GOES HERE

mu = mean(x);
[n, p] = size(x);

sigma = 0;
for i=1:n
    for j=1:p
          sigma = sigma + (x(i,j) - mu(j))^2;
    end
end
sigma = sqrt(sigma/(n*p));

