function y=ytiao(x,x1,m,h)
n=length(x);
L=length(x1);
for k=1:L
    for i=1:n-1
        if (x1(k)>=x(i)&x1(k)<=x(i+1))
            t=(x1(k)-x(i))/h(i);
            u1=(1+2*t)*(t-1)^2;
            u2=t*(t-1)^2;
            u3=t^2*(3-2*t);
            u4=t^2*(t-1);
            sm(k)=fg(x(i))*u1+h(i)*m(i)*u2+fg((i+1))*u3+h(i)*m(i+1)*u4;
       end
   end
end
plot(x,fg(x),x1,sm,'r');