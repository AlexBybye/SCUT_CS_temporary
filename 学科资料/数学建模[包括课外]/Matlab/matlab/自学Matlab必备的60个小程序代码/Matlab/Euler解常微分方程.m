%Euler法求解常微分方程
function y=Euler(a,b,N,af);
h=(b-a)/N;
x(1)=a;
y(1)=af;
yg(1)=af;
yh(1)=af;
jqj(1)=af;
for i=2:N+1
    y(i)=y(i-1)+h*f(x(i-1),y(i-1));%Euler法
    yh(i)=yh(i-1)+(h/4)*(f(x(i-1),yh(i-1))+3*f(x(i-1)+2*h/3,yh(i-1)+2*h*f(x(i-1),yh(i-1))/3));%Heun法
    x(i)=a+(i-1)*h;
    yg(i)=yg(i-1)+h*(f(x(i-1),y(i-1))+f(x(i),y(i)+h*f(x(i-1),y(i-1))))/2;%改进Euler法
    jqj(i)=x(i)+exp((-x(i)));
end
[x',y',yg',yh',jqj']
er=sum((y-jqj).^2)%Euler法误差
erg=sum((yg-jqj).^2)%改进Euler法误差
erh=sum((yh-jqj).^2)%Heun法误差
plot(x,y,'r',x,yg','b',x,yh','k',x,jqj,'g');
legend('Euler法','改进Euler法','Heun法','精确解');
    
