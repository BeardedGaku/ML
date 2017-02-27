function prediction = predictForClassification(svmStruct,x,c)
weights = svmStruct.Alpha;
suppVectors = svmStruct.SupportVectors;
kernFunct = svmStruct.KernelFunction;
prediction = svmStruct.Bias;
for i=1:size(suppVectors,1)
 prediction = prediction + weights(i)*kernFunct(x,suppVectors(i,:),c);
end