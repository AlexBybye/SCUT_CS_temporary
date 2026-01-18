clear all
syms x;
y=(x^2-1)^3+1;
y1=diff(y,x);                       %y对x求一阶导
y2=diff(y,x,2);                     %y对x求二阶导
subplot(3,1,1);                     %把图形窗口分成3×1部分，并激活第1部分
ezplot(y,[-1.5,1.5]);               %对符号函数在[-1.5,1.5]上绘图
subplot(3,1,2);
ezplot(y1,[-1.5,1.5]);
subplot(3,1,3);
ezplot(y2,[-1.5,1.5]);
%通过导数为0的点求最值
x0=solve('6*(x^2-1)^2*x=0','x');    %求解一阶导数(从workspace中得到)为0的点
y0=subs(y,x,x0);                    %把x0带入y中的x
[ymin1,n]=min(eval(y0));            %求y0的最小值
xmin1=x0(n);
%通过fminbnd求函数最值
f=inline('(x^2-1)^3+1','x');
xmin2=fminbnd(f,-1.5,1.5);          %在[-1.5,1.5]上求f函数的最小值点    
ymin2=f(xmin2);