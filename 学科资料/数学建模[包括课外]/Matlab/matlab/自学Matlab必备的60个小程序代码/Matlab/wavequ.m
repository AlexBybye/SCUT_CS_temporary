%波动方程有限差分法
f=inline('sin(pi*x)','x');
g=inline('0');
l=1;T=0.5;m=10;N=10;af=1;
xx=[];tt=[];uu=[];
h=l/m;
k=T/N;
lmd=k*af/h;
u(1,2:N+1)=0;
u(m+1,2:N+1)=0;
u(1,1)=f(0);
u(m+1,1)=f(l);
for i=2:m
    u(i,1)=f((i-1)*h);
    u(i,2)=(1-lmd^2)*f((i-1)*h)+lmd^2*(f(i*h)+f((i-2)*h))/2+k*g((i-1)*h);
end
for j=2:N
    for i=2:m
        u(i,j+1)=2*(1-lmd^2)*u(i,j)+lmd^2*(u(i+1,j)+u(i-1,j))-u(i,j-1);
    end
end
t=linspace(0,T,N+1);
x=linspace(0,l,m+1);
for i=1:m+1
    for j=1:N+1
        xx=[xx,x(i)];
        tt=[tt,t(j)];
        uu=[uu,u(i,j)];
        tur(i,j)=sin(pi*x(i))*cos(pi*t(j));
        ture=[ture,tur(i,j)];
    end
end
re=[xx'     tt'     uu'      ture']