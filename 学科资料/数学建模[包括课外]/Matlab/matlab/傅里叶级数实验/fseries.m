function F=fseries(f,x,n,a,b)
if nargin==3                %若输入为三个参数（缺省）表示f(x)在[-pi,pi]上展开
    a=-pi;
    b=pi;
end
L=(b-a)/2;
F=int(f,x,-L,L)/2*L;        %int(f,x,-L,L)：以符号表达式或符号函数f为被积函数，x为积分变量，-L为下限，L为上限计算定积分
for i=1:n
an=int(f*cos(i*pi*x/L),x,-L,L)/L;
bn=int(f*sin(i*pi*x/L),x,-L,L)/L;
F=F+an*cos(i*pi*x/L)+bn*sin(i*pi*x/L);
end
