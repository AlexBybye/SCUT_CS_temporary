%f(x)=sin(x)
%x=0.5:0.2:1.9;
%y=[0.4794,0.6442,0.7833,0.8912,0.9636,0.9975,0.9917,0.9463];
%x=-1:0.01:1;
%y=1./(1+25*x.^2);
%n=length(x);
%x1=-0.9:0.1:0.9;
function s=fx(x,y,x1)
n=length(x);
m=length(x1);
for k=1:m
    for i=1:n-1
        if (x1(k)>=x(i)&x1(k)<=x(i+1))
           h(i)=x(i+1)-x(i);
           t=(x1(k)-x(i))/h(i);
           s(k)=(1-t)*y(i)+t*y(i+1);
       end
    end
end
%plot(x,y,x1,s,'k');