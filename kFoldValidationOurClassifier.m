function avg_error = kFoldValidationOurClassifier(data1,data2,k)

s = size(data1,1);
totErrorNC = 0;

testPoints = round(s/k);

for i=1:k 
   Xtrain1 = cat(1,data1(1:(testPoints*(i-1)),:),data1(((testPoints*(i)+1):(s)),:));
   Xtrain2 = cat(1,data2(1:(testPoints*(i-1)),:),data2(((testPoints*(i)+1):(s)),:));

    [mu1MLE sigma1MLE] = sge(Xtrain1);
    [mu2MLE sigma2MLE] = sge(Xtrain2);    
    errorNC = 0;
    for j=1:testPoints
        cn = test_classifier(data1(j + testPoints*(i-1),:),mu1MLE,mu2MLE);        
        errorNC = errorNC + (cn ~= 1);
        cn = test_classifier(data2(j + testPoints*(i-1),:),mu1MLE,mu2MLE);
        errorNC = errorNC + (cn ~= -1);
    end
    errorNC = errorNC/(2*testPoints);
    
    totErrorNC = totErrorNC + errorNC;
end
avg_error = totErrorNC/k;


