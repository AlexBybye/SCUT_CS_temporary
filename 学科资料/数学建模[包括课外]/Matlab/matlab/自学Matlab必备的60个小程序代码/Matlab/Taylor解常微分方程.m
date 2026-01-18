%Taylor法求解常微分方程
function y=Taylor(a,b,N,af);
h=(b-a)/N;
x(1)=a;
y2(1)=af;
y4(1)=af;
jqj(1)=af;
for i=2:N
    y2(i)=y2(i-1)+h*((1-h/2)*(x(i-1)-y2(i-1))+1);%二阶Taylor法
    y4(i)=y4(i-1)+h*((1-h/2+h^2/6-h^3/24)*(x(i-1)-y4(i-1))+1)%四阶Taylor法
    x(i)=a+(i-1)*h;
    jqj(i)=x(i)+exp((-x(i)));
end
[x',y2',y4',jqj']
plot(x,y2,'r',x,y4','b',x,jqj,'g');
legend('Taylor2法','Taylor4法','精确解');