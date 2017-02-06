function [Ylabel]  = test_classifier(xVar,var1,var2)

error1 = 0;
error2 = 0;

for i = 1:(size(var1))
    error1 = error1 + abs(var1(i)-xVar(i));
    error2 = error2 + abs(var2(i)-xVar(i));
end

if error1 > error2
    Ylabel = 1;
else 
    Ylabel = -1;
end