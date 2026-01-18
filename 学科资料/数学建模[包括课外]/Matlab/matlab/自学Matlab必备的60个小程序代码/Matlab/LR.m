a=[1,2,3;2,5,2;3,1,5];
b=[14,18,20];
n=size(a,1);
u=zeros(size(a));
l=zeros(size(a));
u(1,:)=a(1,:);
for i=2:n
l(i,1)=a(i,1)/u(1,1);
end
for r=2:n
    for i=r:1:n
        sum1=0;
        for k=1:r-1
           sum1=sum1+l(r,k)*u(k,i);
       end
       u(r,i)=a(r,i)-sum1;
   end
   for i=r+1:n
       sum2=0;
       for k=1:r-1
           sum2=sum2+l(i,k)*u(k,r);
       end
       l(i,r)=(a(i,r)-sum2)/u(r,r);
   end
end
for i=1:n
    l(i,i)=1;
end
y(1)=b(1); 
for i=2:n
    sum3=0;
    for k=1:i-1
        sum3=sum3+l(i,k)*y(k);
    end
    y(i)=b(i)-sum3;
end
y
x(n)=y(n)/u(n,n);
for i=n-1:-1:1
    sum4=0;
    for k=i+1:n
        sum4=sum4+u(i,k)*x(k);
    end
    x(i)=(y(i)-sum4)/u(i,i);
end
x
   