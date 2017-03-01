function output = rbfKernel(x1,x2,sigma)
output = exp(-(1/(2*sigma^2))*norm(x1-x2));
