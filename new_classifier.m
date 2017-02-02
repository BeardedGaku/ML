function [Ytest] = new_classifier(Xtest, mu1, mu2)
m1Minusm2 = mu1 - mu2;
b = 0.5*(mu1 + mu2);
Ytest = sign((m1Minusm2*(Xtest - b)')/(norm(m1Minusm2)));
