function [x1,n]=newton(x0)
x1=x0-fc(x0)/df(x0);
n=1;
while(abs(x1-x0)>=1.0e-6)&(n<=100000000)
    x0=x1;
    x1=x0-fc(x0)/df(x0);
    n=n+1;
end
