%a=[0.003000,59.14;5.291,-6.130];%系数矩阵a1
%b=[59.17,46.78]';
%a=[1,-1,2,-1;2,-2,3,-3;1,1,1,0;1,-1,4,3];%系数矩阵a
%b=[-8,-20,-2,4]';
a=[0.012,0.01,0.167;1,0.8334,5.91;3200,1200,4.2];
b=[0.6781,12.1,981]';
n=length(b);
s=max(abs(a(:,1:n)));
for k=1:n-1
    for p=k:n
        if (abs(a(p,k))/s(p)==max(abs(a(k:n,k))./s(k:n)'));   
           p;
           break;
        end
    end
    if(p~=k)
      t=a(k,:);
      a(k,:)=a(p,:);
      a(p,:)=t;
      u=b(k);
      b(k)=b(p);
      b(p)=u;
    end
    for i=k+1:n
        m(i,k)=a(i,k)/a(k,k);
        for j=1:n
            a(i,j)=a(i,j)-m(i,k)*a(k,j);
        end
            b(i)=b(i)-m(i,k)*b(k);
    end
end
x(n)=b(n)/a(n,n);
for i=n-1:-1:1
    sum=0;
    for j=i+1:n
        sum=sum+a(i,j)*x(j);
    end
    x(i)=(b(i)-sum)/a(i,i);
end
jie=x'
     


        
        
    
    