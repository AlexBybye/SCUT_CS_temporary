x=-1:0.01:1;
y1=-50./(1+25.*x.^2).^2.*x;
n=length(x);
h(1)=x(2)-x(1);
for i=2:n-1
    h(i)=x(i+1)-x(i);
    lm(i)=h(i)/(h(i-1)+h(i));
    mu(i)=1-lm(i);
    c1(i)=3*(lm(i)*(fg(x(i))-fg(x(i-1)))/h(i-1)+mu(i)*(fg(x(i+1))-fg(x(i)))/h(i));
end
c(1:n-2)=c1(2:n-1);
m(1)=y1(1);
m(n)=y1(n);
c(1)=c(1)-lm(2)*m(1);
c(n-2)=c(n-2)-mu(n-1)*m(n);
a=2*ones(1,n-2);
b=lm(3:n-1);
d=mu(2:n-2);
X=trisys(d,a,b,c);
m(2:n-1)=X;
x1=-0.9:0.1:0.9;
L=length(x1);
for k=1:L
    for i=1:n-1
        if (x1(k)>=x(i)&x1(k)<=x(i+1))
            t=(x1(k)-x(i))/h(i);
            u1=(1+2*t)*(t-1)^2;
            u2=t*(t-1)^2;
            u3=t^2*(3-2*t);
            u4=t^2*(t-1);
            sm(k)=fg(x(i))*u1+h(i)*m(i)*u2+fg((i+1))*u3+h(i)*m(i+1)*u4;
       end
   end
end
plot(x,fg(x),x1,sm,'r');
hold on;
