clear all
close all
a=0;b=1;m=10;T=0.5;N=1000;af=1;
f=inline('sin(pi*x)','x');
h=(b-a)/m;
k=T/N;
lmd=af^2*k/h^2;   %注意lmd一定要小于0.5,只有这样差分法才稳定
x=linspace(a,b,m+1);
u(1,1:N+1)=0;
u(m+1,1:N+1)=0;
for i=2:m
    u(i,1)=f(a+(i-1)*h);
end
    
for j=1:N
        t=j*k;
        for i=2:m
        u(i,j+1)=(1-2*lmd)*u(i,j)+lmd*(u(i+1,j)+u(i-1,j));
    end
end
true=exp(-pi^2*T).*sin(pi*x);
error=abs(u(:,N+1)-true');
re=[x'     u(:,N+1)      true'        error]