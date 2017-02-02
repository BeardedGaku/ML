clc; clear all; close all;
data = load('dataset2.mat');
X = data.x;
Y = data.y;

X1 = X(find(Y==1),:);
X2 = X(find(Y==-1),:);

s = size(X1,1);
totErrorB = 0;
totErrorNC = 0;
for i=1:5 
    Xtrain = [X(1:(200*(i-1)),:); X(((200*(i)+1):(1000)),:);
        X(1001:(1000+200*(i-1)),:); X(((200*(i)+1001):(2000)),:)];
    Ytrain = [Y(1:(200*(i-1))); Y(((200*(i)+1):(1000)));
        Y(1001:(1000+200*(i-1))); Y(((200*(i)+1001):(2000)))];
    [mu1MLE sigma1MLE] = sge(Xtrain(find(Ytrain==1),:));
    [mu2MLE sigma2MLE] = sge(Xtrain(find(Ytrain==-1),:));
    errorB = 0;
    errorNC = 0;
    for j=1:200
        [prop1 prop2 cb] = sph_bayes(X(200*(i-1)+j,:),Xtrain,Ytrain);
        cn = new_classifier(X(200*(i-1)+j,:),mu1MLE,mu2MLE);
        errorB = errorB + (cb ~= Y(200*(i-1)+j));
        errorNC = errorNC + (cn ~= Y(200*(i-1)+j));
        
        [prop1 prop2 cb] = sph_bayes(X(200*(i-1)+j+1000,:),Xtrain,Ytrain);
        cn = new_classifier(X(200*(i-1)+j+1000,:),mu1MLE,mu2MLE);
        errorB = errorB + (cb ~= Y(200*(i-1)+j+1000));
        errorNC = errorNC + (cn ~= Y(200*(i-1)+j+1000));
    end
    totErrorB = totErrorB + errorB;
    totErrorNC = totErrorNC + errorNC;
end
