function fp=fitpt()
%最小二乘
%基取{1, x, ...}
%fitpt.m

%默认算例为课本：P65，例3.2
%	x=[0,1,2,3,4,5,6,7]
%	y=[3.95,6.82,9.78,12.91,15.74,19.26,21.73,24.07]
%结果：P(x) = 4.005 + 2.936x		平方误差=0.6162

%MatLab函数：polyfit(x,y,n)

s=input('<最小二乘>\n输入已知点的x坐标：（回车表示[0,1,2,3,4,5,6,7]）\n', 's');
if isempty(s)
	s='[0,1,2,3,4,5,6,7]';
else
	if (s(1)~='[')
		s=strcat('[', s);
		s=strcat(s, ']');
	end
end
x=sym(s);

s=input('输入已知点的y坐标：（回车表示[3.95,6.82,9.78,12.91,15.74,19.26,21.73,24.07]）\n', 's');
if isempty(s)
	s='[3.95,6.82,9.78,12.91,15.74,19.26,21.73,24.07]';
else
	if (s(1)~='[')
		s=strcat('[', s);
		s=strcat(s, ']');
	end
end
y=sym(s);
sz=size(x);
sz=sz(2);
n=input('输入多项式次数n：');
if (n+1>sz)
    n=input('多项式次数需要小于已知点个数，请重新输入n：');
end
if (n+1>sz)
    error('多项式次数不能小于已知点个数！');
end
fp=s_fitpt_p(x,y,n);

%Diagram
plot(double(x),double(y),'r*')
hold on
a=double(x(1));
b=double(x(sz));
x=a:abs(b-1)/100:b;
y=subs(fp,x);
plot(x,y)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function f=s_fitpt_p(x,y,n)
%用n次多项式实现的最小二乘法

sz=size(x);
sz=sz(2);
A=zeros(sz, n+1);
v=vh(n);
for i=1:sz
    A(i,:)=subs(v, double(x(i)));
end
f=linsolve(A'*A, A'*y');
f=vpa(f,4);
f=v*f;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function v=vh(n)
%Create vector in horizontal style, such as 
%		v=[1, x, x^2, ..., x^n]

if (n<0 | n>9)
	error('Make sure ''n'' is in range of [0, 9]')
end
s='';
for i=0:n
	s=strcat(s, ',x^');
	s=strcat(s, num2str(i));
end
s(1)='[';
sz=size(s);
s(sz(2)+1)=']';

v=simplify(sym(s));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%