clear all
%图论网络流最大流 Ford-Fulkerson标号算法
n=6;%六个顶点
%C为容量的邻接的矩阵
C=[0,16,20,0,0,0;
   0,0,0,10,10,0;
   0,0,0,6,6,0;
   0,0,0,0,0,10;
   0,0,0,0,0,16;
   0,0,0,0,0,0];
f=zeros(n,n);%F为流,初始流为0流

while 1%大循环

%标号过程
%标号初始化
No=zeros(1,6);d=zeros(1,6);%No记录该点标号的获得点 d记录调整量
No(1)=n+1;d(1)=inf;%给发点Vs标号
while 1%标号循环
pd=0;
for i=1:n
for j=1:n
if No(i)~=0%选择一个已标号的点x
if No(j)==0%对于它的未标号邻接点y
if C(i,j)>0%当(x,y)是一条边时
if f(i,j)<C(i,j)%判断增广链条件
No(j)=i;        %标号 
d(j)=min([C(i,j)-f(i,j),d(i)]);
pd=1;
end
end
if C(j,i)>0%当(y,x)是一条边时
if f(j,i)>0%判断增广链条件
No(j)=-i;   %标号
d(j)=min([f(j,i),d(i)]);
pd=1;
end
end
end
end
end
end

if No(n)==1%当Vt表上号时跳出标号循环
break;
end
if pd==0; %当无法标号时跳出标号循环
break;
end
end

if No(n)==0%当Vt无法表上号时跳出大循环此时已是最大流
break;
end

%调整过程
t=n;%t为正在调整的点
for i=1:n %调整循环
if No(t)>0%正向流入的增加
f(No(t),t)=f(No(t),t)+d(n);
end
if No(t)<0%反向流出的减小 
f(t,abs(No(t)))=f(t,abs(No(t)))-d(n);
end

if abs(No(t))==1%如果下一个点为发点跳出调整循环
break;
else
t=abs(No(t));%继续调整上游点   
end
end

end
f%显示最大流
wf=0;
for i=1:n
wf=f(1,i)+wf;
end
wf%显示最大流流量
No%显示最小割