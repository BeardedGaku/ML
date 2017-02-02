%function prob = ProbabilityGaussian(xnew, mu, sigma)
xnew = [1 1 1];
mu = mu1MLE;
sigma= sigma1MLE*eye(3);
d=size(xnew,2);
xminusmu = xnew - mu;
%expo = exp(-(1/(2*sigma^2))*xminusmu*transpose(xminusmu));
%mult = (1/(((2*3.14)^(d/2) * sigma^d)));

%prob = (1/(((2*3.14)^(d/2) * sigma^d)))* expo;
p2= mvnpdf(xnew,mu,sigma);
