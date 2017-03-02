function [zetas2, zetaOld] = linearKernel(X,k)
oldcentroids = randomCentroidInitialization(k,X);
zetaOld = dataAssignment(oldcentroids,X);
convergence = false;
criterionConvergence = 0.0;
maxIterations = 1000000;

iterations = 1;
costs = [];

while(convergence==false && iterations < maxIterations)
%plotClasses(zetaOld,X,k,iterations + 1);
if(iterations==2)
zetas2 = zetaOld;
end
newCentroids = createCentroids(zetaOld,X);
zetaNew = dataAssignment(newCentroids,X);
convMeasurement = mean(sum((zetaOld - zetaNew).^2,2));
zetaOld = zetaNew;
costs = cat(1,costs,convMeasurement);
if(convMeasurement <= criterionConvergence)
   convergence = true;
end

iterations = iterations + 1;
end


