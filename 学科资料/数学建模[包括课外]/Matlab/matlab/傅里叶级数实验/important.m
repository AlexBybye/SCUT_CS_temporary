clear all
syms x;
f=(exp(x)-1)*(sin(x)-1);        %直接由已定义的符号变量产生符号表达式
xx=-pi:pi/200:pi;
yy=subs(f,x,xx);   %将符号表达式中的x符号变量变为xx数值量求值
n=9;
f1=fseries(f,x,n); 
y1=subs(f1,x,xx);
plot(xx,y1,xx,yy)
