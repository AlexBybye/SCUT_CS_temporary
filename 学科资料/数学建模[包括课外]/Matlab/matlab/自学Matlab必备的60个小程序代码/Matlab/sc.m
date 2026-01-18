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
m(1)=y1(1);
m(n)=y1(n);
c(1:n-2)=c1(2:n-1);
c(1)=c(1)-lm(2)*m(1);
c(n-2)=c(n-2)-mu(n-1)*m(n);
a=2*ones(1,n-2);
b=lm(3:n-1);
d=mu(2:n-2);
X=trisys(d,a,b,c);
m(2:n-1)=X;
x1=-0.9:0.1:0.9;
ytiao(x,x1,m,h);


