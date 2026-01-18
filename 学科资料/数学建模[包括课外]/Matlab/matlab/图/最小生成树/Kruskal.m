clear all
%图论最小生成树Kruskal避圈算法(使用时根据题目修改w和n)
%w为邻接矩阵
w=[0   3   4   7   inf inf inf;
   3   0   3   2   4   inf inf; 
   4   3   0   inf 5   7   inf;
   7   2   inf 0   2   inf 6;
   inf 4   5   2   0   1   4;
   inf inf 7   inf 1   0   2;
   inf inf inf 6   4   2   0];
n=7;%有七个点
k=1;
for i=1:n-1
for j=i+1:n
if w(i,j)~=inf
    x(1,k)=w(i,j);%记录边
    x(2,k)=i;%记录起点
    x(3,k)=j;%记录终点
    k=k+1;
end
end
end
k=k-1;%统计边数 k为边数

%步骤一
%冒泡法给边的大小排序
for i=1:k
for j=i+1:k
    if x(1,i)>x(1,j)
    a=x(1,i);x(1,i)=x(1,j);x(1,j)=a;
    a=x(2,i);x(2,i)=x(2,j);x(2,j)=a;
    a=x(3,i);x(3,i)=x(3,j);x(3,j)=a;
    end
end
end
%给各点标号赋初值
for i=1:n
l(i)=i;
end
%初始时选e1加入集合E
E(1,1)=x(1,1); %E矩阵的第一行记录最小生成树的边长
E(2,1)=x(2,1); %E矩阵的第二行记录边的起点
E(3,1)=x(3,1); %E矩阵的第三行记录边的终点
a=min([l(E(2,1)),l(E(3,1))]);
l(E(2,1))=a;l(E(3,1))=a;
b=1;%记录E中边数

for i=2:k
%步骤四
if b==n-1 %如果树中边数达到n-1
break     %算法终止
end
%步骤二
if l(x(2,i))~=l(x(3,i))  %如果两顶点标号不同
b=b+1;                   %将这条边加入E
E(1,b)=x(1,i);
E(2,b)=x(2,i);
E(3,b)=x(3,i);

%步骤三
for j=1:n                %对于所有顶点
if l(j)==max([l(E(2,b)),l(E(3,b))])%如果该顶点的标号,等于=,新加入边中的顶点标号较大的值
l(j)=min([l(E(2,b)),l(E(3,b))]);%将其改为较小的那一个以避圈
end
end
end
end