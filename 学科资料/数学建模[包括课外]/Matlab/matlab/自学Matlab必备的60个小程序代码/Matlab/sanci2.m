%x=-1:0.01:1;
%y1=5000./(1+25.*x.^2).^3.*x.^2-50./(1+25.*x.^2).^2;
function sm=sanci2(x,y,x1)
y1=0;
y11=0;
n=length(x);
h(1)=x(2)-x(1);
for i=2:n-1
    h(i)=x(i+1)-x(i);
    lm(i)=h(i)/(h(i-1)+h(i));
    mu(i)=1-lm(i);
    c1(i)=3*(lm(i)*(y(i)-y(i-1))/h(i-1)+mu(i)*(y(i+1)-y(i))/h(i));
end
c1(1)=3*(y(2)-y(1))/h(1)-h(1)*y1/2;
c1(n)=3*(y(n)-y(n-1))/h(n-1)-h(n-1)*y11/2;
c(1:n)=c1(1:n);
a=2*ones(1,n);
b=[lm(2:n-1) 1];
d=[1 mu(2:n-1)];
X=trisys(d,a,b,c);
m(1:n)=X;
%x1=-0.9:0.1:0.9;
L=length(x1);
for k=1:L
    for i=1:n-1
        if (x1(k)>=x(i)&x1(k)<=x(i+1))
            t=(x1(k)-x(i))/h(i);
            u1=(1+2*t)*(t-1)^2;
            u2=t*(t-1)^2;
            u3=t^2*(3-2*t);
            u4=t^2*(t-1);
            sm(k)=y(i)*u1+h(i)*m(i)*u2+y(i+1)*u3+h(i)*m(i+1)*u4;
       end
   end
end
%plot(x,fg(x),x1,sm,'r');
%hold on;
