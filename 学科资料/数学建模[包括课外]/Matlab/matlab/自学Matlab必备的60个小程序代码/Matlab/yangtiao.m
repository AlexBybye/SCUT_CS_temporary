function yangtiao(X,Y,x)
n=length(X);
m=length(x);
for i=1:n-1
    h(i)=X(i+1)-X(i);
end
for i=2:n-1
    l(i)=h(i+1)/(h(i)+h(i+1));
    u(i)=1-l(i);
    g(i)=3*(l(i)*(Y(i)-Y(i-1))/h(i-1))+u(i)*(Y(i-1)-Y(i))/(-h(i-1));
end
g(1)=3*(Y(2)-Y(1))/h(1);
g(n)=3*(Y(n)-Y(n-1))/h(n-1);
A=zeros(n);
for i=2:n-1
    A(i,i)=2;
    A(i,i-1)=l(i);
    A(i,i+1)=u(i);
end
A(1,1)=2;
A(1,2)=1;
A(n,n-1)=1;
A(n,n)=2;
    