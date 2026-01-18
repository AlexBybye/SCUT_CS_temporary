X=0:pi/20:pi;
Y=sin(X);
x1=0.5:0.2:1.9;
y1=[0.4794,0.6442,0.7833,0.8912,0.9636,0.9975,0.9917,0.9463];
x=0.6:0.2:1.8;
L=Langrange(x1,y1,x);
s=fx(x1,y1,x);
sm=sanci2(x1,y1,x)
plot(X,Y,'r');
hold on;
plot(x,L,'gd',x,s,'b+',x,sm,'co');
xlabel('X');
ylabel('Y');
legend('原图像','Langrange','线性插值','样条插值');