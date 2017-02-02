function [P1, P2, Ytest]=sph_bayes(Xtest, X, Y)
 
py1 = sum(Y==1)/size(Y,1);
py2 = sum(Y==-1)/size(Y,1);


[mu1MLE sigma1MLE] = sge(X(find(Y==1),:));
[mu2MLE sigma2MLE] = sge(X(find(Y==-1),:));



pxnew1= mvnpdf(Xtest,mu1MLE,sigma1MLE*eye(size(Xtest,2)));
pxnew2= mvnpdf(Xtest,mu2MLE,sigma2MLE*eye(size(Xtest,2)));

P1 = (pxnew1*py1)/(pxnew1*py1 + pxnew2 * py2);
P2 = (pxnew2*py2)/(pxnew1*py1 + pxnew2 * py2);

Ytest = sign(P1-P2);