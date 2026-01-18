function [x1,n]=gexian(x0,x1)
x2=x1-fc(x1)*(x1-x0)/(fc(x1)-fc(x0));
n=1;
while(abs(x1-x0)>=1.0e-6)&(n<=100000000)
    x0=x1;
    x1=x2;
    x2=x1-fc(x1)*(x1-x0)/(fc(x1)-fc(x0));
    n=n+1;
end
