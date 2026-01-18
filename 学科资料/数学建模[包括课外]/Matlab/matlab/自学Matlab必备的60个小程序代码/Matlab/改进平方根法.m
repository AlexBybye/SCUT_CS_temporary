tic
%其中a为对称正定矩阵
a=[5,-4,1,0;-4,6,-4,1;1,-4,6,-4;0,1,-4,5];
b=[2,-1,-1,2];
%a=[4,-1,1;-1,4.26,2.75;1,2.75,3.5];
%b=[8,4,10];
n=size(a,1);
d(1)=a(1,1);
for i=2:n
    for j=1:i-1
        sum1=0;
        for k=1:j-1
            sum1=sum1+t(i,k)*l(j,k);
        end
        t(i,j)=a(i,j)-sum1;
        l(i,j)=t(i,j)/d(j);
    end
    sum2=0;
    for k=1:i-1
        sum2=sum2+t(i,k)*l(i,k); 
    end 
    d(i)=a(i,i)-sum2;
end
for i=1:n
    l(i,i)=1;
end
y1(1)=b(1);
for i=2:n
    sum3=0;
    for k=1:i-1
        sum3=sum3+l(i,k)*y1(k);
    end
    y1(i)=b(i)-sum3;
end
y1
x1(n)=y1(n)/d(n);
for i=n-1:-1:1
    sum4=0;
    for k=i+1:n
        sum4=sum4+l(k,i)*x1(k);
    end
    x1(i)=y1(i)/d(i)-sum4;
end
x1
toc