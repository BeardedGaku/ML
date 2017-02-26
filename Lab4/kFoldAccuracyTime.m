function [classError, time] = kFoldAccuracyTime(X, Y, k, kernel_function, opt_method, varargin)
switch nargin
    case 5
        plotting = false;
        save_img  = false;
    case 6
        plotting = varargin{1};
        save_img  = false;
    case 7
        plotting = varargin{1};
        save_img  = varargin{1} && varargin{2};
end

if (save_img && ~exist('img')) mkdir('img'); end;

classError = 0;
t = cputime;
for i=1:5
    binsize = size(X,1) / k;
    
    xtrain = X(1:(k-1)*binsize,:);
    ytrain = Y(1:(k-1)*binsize,:);

    if (plotting) fig = figure(i); end;
    svmStruct = svmtrain(xtrain,ytrain,'ShowPlot',plotting, 'boxconstraint', 1.0, 'kernel_function', kernel_function, 'method', opt_method);

    xtest = X((k-1)*binsize + 1 : size(X,1),:);
    ytest = Y((k-1)*binsize + 1 : size(Y,1),:);

    species = svmclassify(svmStruct,xtest,'ShowPlot',plotting);

    classError = classError + size(find(species - ytest ~= 0),1)/size(species,1);
    X = circshift(X,binsize,1);
    Y = circshift(Y,binsize,1);
    
    if save_img
        img_name = ['img\',kernel_function, opt_method, num2str(i), '.png'];
        saveas(fig,img_name);
    end
end

time = cputime - t;

classError  = classError / k;


