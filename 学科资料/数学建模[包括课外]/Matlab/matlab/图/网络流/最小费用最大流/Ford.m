function [minroad,s]=Ford(w)          %注意此文件名一定要为Ford.m
%图论最短路的Ford迭代算法
%w为邻接矩阵(点与点的关系)
n=size(w,1);%记录图中点数
%赋初值
for i=1:n
p(i)=inf;%V1到Vi的最短路长记为p(i)
s(i)=i;%V1到Vi的最短路中Vi的前一个点记为s(i)
end
p(1)=0;
s(1)=1;

while 1
pd=0;
for i=2:n
for j=1:n
if p(i)>p(j)+w(j,i) %如果到i还有更短的路
p(i)=p(j)+w(j,i);   %修正p(i)
s(i)=j;             %修正s(i)
pd=1;
end    
end
end
if pd==0            %所有的p(i)都无变化终止循环
break;
end
end
minroad=p(n);