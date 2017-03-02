function zetasFinal = kMeansRBFkernel(X,k,sigma)
zetaOld = zeros(size(X,1),k);
for i=1:size(X,1)
index = round( 1 + (k-1)*rand());
zetaOld(i,index) = 1;
end

convergence = false;
criterionConvergence = 0.0;
maxIterations = 1000000;
iterations = 1;
costs = [];

kernels = calculationOfKernels(X,sigma);

while(~convergence && iterations < maxIterations)
%plotClasses(zetaOld,X,k,iterations + 1);

zetaNew = dataAssignmentKernel(zetaOld,kernels);

convMeasurement = mean(sum((zetaOld - zetaNew).^2,2));
zetaOld = zetaNew;

costs = cat(1,costs,convMeasurement);
if(convMeasurement <= criterionConvergence)
   convergence = true;
end

iterations = iterations + 1;
end
zetasFinal = zetaOld;