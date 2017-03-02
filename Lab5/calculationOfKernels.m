function kernelsValues = calculationOfKernels(data,sigma)
dim1 = size(data,1);
kernelsValues = zeros(dim1);

for i=1:dim1
  for j = i:dim1
    kernelsValues(i,j) = rbfKernel(data(i,:),data(j,:),sigma);
    kernelsValues(j,i) = kernelsValues(i,j);
  end
end
