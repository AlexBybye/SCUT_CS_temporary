close all;
clear all;
a=0;b=1;m=10;T=0.5;N=50;af=1;
f=inline('sin(pi*x)','x');
h=(b-a)/m;
k=T/N;
lmd=af^2*k/h^2;
x=linspace(a,b,m+1);
x=x(2:m+1);
u(m)=0;
for i=1:m-1
    u(i)=f(i*h);
end
l(1)=1+lmd;
v(1)=-lmd/(2*l(1));
for i=2:m-2
    l(i)=1+lmd+lmd*v(i-1)/2;
    v(i)=-lmd/(2*l(i));
end
l(m-1)=1+lmd+lmd*v(m-2)/2;
for j=1:N
    t=j*k;
    z(1)=[(1-lmd)*u(1)+lmd*u(2)/2]/l(1);
    for i=2:m-1
        z(i)=((1-lmd)*u(i)+lmd*(u(i+1)+u(i-1)+z(i-1))/2)/l(i);
    end
    u(m-1)=z(m-1);
    for i=m-2:-1:1
        u(i)=z(i)-v(i)*u(i+1);
    end
end
true=exp(-pi^2*T).*sin(pi*x);
error=abs(u'-true');
re=[x'     u'      true'        error]

        
