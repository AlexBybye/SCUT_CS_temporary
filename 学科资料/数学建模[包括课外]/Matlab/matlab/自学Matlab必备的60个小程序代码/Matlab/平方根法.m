a=[4,-1,1;-1,4.25,2.75;1,2.75,3.5];
b=[8,4,10];
%a=[1,2,3;2,5,2;3,1,5];
%b=[14,18,20];
n=size(a,1);
l(1,1)=sqrt(a(1,1));
for i=2:n
    l(i,1)=a(i,1)/l(1,1);
end
for j=2:n
    sum1=0;
    for k=1:j-1
        sum1=sum1+l(j,k)*l(j,k);
    end
    l(j,j)=sqrt(a(j,j)-sum1);
    for i=j+1:n
        sum2=0;
        for k=1:j-1
            sum2=sum2+l(i,k)*l(j,k);
        end
        l(i,j)=(a(i,j)-sum2)/l(j,j);
    end
end
l
y(1)=b(1)/l(1,1);
for i=2:n
    sum3=0;
    for k=1:i-1
        sum3=sum3+l(i,k)*y(k);
    end
    y(i)=(b(i)-sum3)/l(i,i);
end
y
x(n)=y(n)/l(n,n);
for i=n-1:-1:1
    sum4=0;
    for k=i+1:n
        sum4=sum4+l(k,i)*x(k);
    end
    x(i)=(y(i)-sum4)/l(i,i);
end
x