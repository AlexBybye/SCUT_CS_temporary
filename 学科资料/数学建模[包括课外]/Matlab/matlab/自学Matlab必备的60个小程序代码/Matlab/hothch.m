a=0;b=1;m=10;T=0.5;N=50;af=1;
f=inline('sin(pi*x)','x');
h=(b-a)/m;
k=T/N;
lmd=af^2*k/h^2;
x=linspace(a,b,m+1);
x=x(2:m);
i=1:m-1;
u=f(i.*h);
for j=1:N
    t=j*k;
    u=trisys(-lmd*ones(m-2,1),1+2*lmd*ones(m-1,1),-lmd*ones(m-2,1),u);
end
%u'
true=exp(-pi^2*T).*sin(pi*x);
error=abs(u-true);
re=[x'     u'       true'        error']
