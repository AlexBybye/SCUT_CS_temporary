%MC搜索
%复杂度低随机性强
r1=unifrnd(0,10,100000,1);                                       %产生x1的n*1随机矩阵
r2=unifrnd(0,10,100000,1);                                       %产生x2的n*1随机矩阵
sol=[r1(1) r2(1)];
z0=-inf;                                                         %z0初始化
f=inline('-2*x(1)^2-x(2)^2+x(1)*x(2)+8*x(1)+3*x(2)','x');        %目标函数
for i=1:100000
x1=r1(i);
x2=r2(i);
y=yueshu([x1 x2]);
if y==1                                                          %当满足约束条件时
z=f([x1 x2]); 
if z>=z0                                                         %求最大值
    z0=z;
    sol=[x1 x2];                                                 %最值解
end
end
end
sol
z0


%网格搜索
%复杂度高确定性好
clear all
r1=linspace(0,10,1000);                                         %产生x1的n*1均匀矩阵
r2=linspace(0,10,1000);                                         %产生x2的n*1均匀矩阵
sol=[r1(1) r2(1)];
z0=-inf;                                                         %z0初始化
f=inline('-2*x(1)^2-x(2)^2+x(1)*x(2)+8*x(1)+3*x(2)','x');        %目标函数
for j=1:1000                                                     %穷举网格点
for i=1:1000
x1=r1(j);
x2=r2(i);
y=yueshu([x1 x2]);
if y==1                                                          %当满足约束条件时
z=f([x1 x2]); 
if z>=z0                                                         %求最大值
    z0=z;
    sol=[x1 x2];                                                 %最值解
end
end
end
end
sol
z0