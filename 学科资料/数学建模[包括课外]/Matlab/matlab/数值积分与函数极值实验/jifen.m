%一重积分
%求利用符号函数求理论值
syms x;
y=exp(-x^2);                  %被积函数
s=int(y,x,0,1);               %调用int函数
v=vpa(s);                     %将符号表达式转化为数值
%利用quad函数进行数值积分
f1=inline('exp(-x.^2)','x');   %被积函数
y1=quad(f1,0,1);

%二重积分
f2=inline('exp((-x.^2)/2).*sin(x.^2+y)','x','y');
y2=dblquad(f2,-2,2,-1,1);

%三重积分
f3=inline('4*x.*z.*exp(-(x.^2).*y-z.^2)','x','y','z');
y3=triplequad(f3,0,2,0,pi,0,pi);