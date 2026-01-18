a=[2,-1,0,0;-1,2,-1,0;0,-1,2,-1;0,0,-1,2];
b=[1,0,0,1];
n=size(a,1);
l(1,1)=a(1,1);
for i=1:n-1
    l(i+1,i)=a(i+1,i);
    u(i,i+1)=a(i,i+1)/l(i,i);
    l(i+1,i+1)=a(i+1,i+1)-l(i+1,i)*u(i,i+1);
end
y(1)=b(1)/l(1,1);
for i=2:n
    y(i)=(b(i)-l(i,i-1)*y(i-1))/l(i,i);
end
x(n)=y(n);
for i=n-1:-1:1
    x(i)=y(i)-u(i,i+1)*x(i+1);
end
x'