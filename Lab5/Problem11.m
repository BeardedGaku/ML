%% a and b question

clear all; close all; clc;
load hw5_p1a.mat;
%load hw5_p1b.mat;


%initialization
k = 2;
oldcentroids = randomCentroidInitialization(k,X);
zetaOld = dataAssignment(oldcentroids,X);
convergence = false;
criterionConvergence = 0.0000001;
maxIterations = 10;

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
if(convMeasurement < criterionConvergence)
   convergence = true;
end

iterations = iterations + 1;
end


plot2AndEnd(zetas2,zetaOld,X,k,1);
%plotClasses(zetaOld,X,k,2);


%% c and d question
clear all; close all; clc
%load hw5_p1a.mat;
%load hw5_p1b.mat;
k = 2;
zetaOld = zeros(size(X,1),k);
for i=1:size(X,1)
index = round( 1 + (k-1)*rand());
zetaOld(i,index) = 1;
end

convergence = false;
criterionConvergence = 0.0000001;
maxIterations = 1000000;
sigma = 0.2;
iterations = 1;
costs = [];

while(~convergence && iterations < maxIterations)
plotClasses(zetaOld,X,k,iterations + 1);
if(iterations==2)
zetas2 = zetaOld;
end

zetaNew = dataAssignmentKernel(zetaOld,X,sigma);

convMeasurement = mean(sum((zetaOld - zetaNew).^2,2));
zetaOld = zetaNew;

costs = cat(1,costs,convMeasurement);
if(convMeasurement <= criterionConvergence)
   convergence = true;
end

iterations = iterations + 1;
end


%plot2AndEnd(zetas2,zetaOld,X,k,1);
%plotClasses(zetaOld,X,k,2);
