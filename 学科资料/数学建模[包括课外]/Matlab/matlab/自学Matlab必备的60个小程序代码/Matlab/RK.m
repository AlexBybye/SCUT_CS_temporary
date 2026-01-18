%四阶RK法求解常微分方程
function y=RK(a,b,N,af);
h=(b-a)/N;
x(1)=a;
y(1)=af;
jqj(1)=af;
for i=2:N+1
    K1=f(x(i-1),y(i-1));
    K2=f(x(i-1)+h/2,y(i-1)+h*K1/2);
    K3=f(x(i-1)+h/2,y(i-1)+h*K2/2);
    K4=f(x(i-1)+h,y(i-1)+h*K3);
    y(i)=y(i-1)+(K1+2*K2+2*K3+K4)/6;
    x(i)=x(i-1)+(i-1)*h;
    jqj(i)=x(i)+exp((-x(i)));
end
[x',y',jqj']
er=norm(y-jqj,2)/norm(y)
plot(x',y','r',x',jqj','g');
legend('RK法','精确解');