clear all
%图论最小费用最大流问题程序
%最大流未知
%C为容量邻接矩阵
C=[0 8 7 0 0 0;
   0 0 5 9 0 0;
   0 0 0 0 9 0;
   0 0 2 0 0 5;
   0 0 0 6 0 10;
   0 0 0 0 0 0];
%B为费用邻接矩阵
B=[0 2 8 0 0 0;
   0 0 5 2 0 0;
   0 0 0 0 3 0;
   0 0 1 0 0 6;
   0 0 0 4 0 7;
   0 0 0 0 0 0];
n=6;%6个点
f=zeros(n,n);%初始流为0流
w=ones(n,n)*inf;%邻接矩阵初始化

while 1
%求最小费用流
%确定费用邻接矩阵
for i=1:6
for j=1:6
if i==j
w(i,j)=0;
end   
if C(i,j)>0 %如果存在(i,j)这条边(路),再对w作出调整
if f(i,j)<C(i,j)
w(i,j)=B(i,j);
end
if f(i,j)==C(i,j)
w(i,j)=inf;
end
if f(i,j)>0
w(j,i)=-B(i,j);
end
if f(i,j)==0
w(j,i)=inf;
end
end
end
end

%使用Ford算法求最短路
[minroad,s]=Ford(w);

if minroad==inf%若不存在费用最短路,则已是最小费用最大流跳出循环
break;
end

%调整可行流
%记录最短路
t=n;
R=[n]; 
while 1
R=[R,s(t)];
if s(t)==1%找到最短路的初始点时跳出循环
break;
end
t=s(t);
end
%统计R中点数
for i=1:n
if R(i)==1
break;
end
end
number=i;%number为点数

%调整过程
%确定调整量
for j=number-1:-1:1
if C(R(j+1),R(j))>0%如果是正向边
r(j)=C(R(j+1),R(j))-f(R(j+1),R(j));
end
if C(R(j),R(j+1))>0%如果是负向边
r(j)=f(R(j),R(j+1));
end
end
dvt=min(r);%确定调整量
%调整
for j=number-1:-1:1
if C(R(j+1),R(j))>0%如果是正向边
f(R(j+1),R(j))=f(R(j+1),R(j))+dvt;
end
if C(R(j),R(j+1))>0%如果是负向边
f(R(j),R(j+1))=f(R(j),R(j+1))-dvt;
end
end

end
f %显示最小费用最大流

wf=0;
for i=1:n
wf=wf+f(1,i);
end
wf %显示流量

zwf=0;
for i=1:n
for j=1:n
zwf=zwf+f(i,j)*B(i,j);
end
end
zwf %显示费用