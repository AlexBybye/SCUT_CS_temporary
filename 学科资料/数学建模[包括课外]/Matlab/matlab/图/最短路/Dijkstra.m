clear all
%图论最短路问题的Dijkstra算法
%邻接矩阵(点与点的关系)
w=[0,2,4,inf,inf,inf,inf;  
   2,0,inf,3,3,1,inf;
   4,inf,0,2,3,1,inf;                      
   inf,3,2,0,inf,inf,1;                    
   inf,3,3,inf,0,inf,3;
   inf,1,1,inf,inf,0,4;
   inf,inf,inf,1,3,4,0];
n=size(w,1);%记录图中点数
for i=1:n
l(i)=w(1,i);%为l(v)赋初值
z(i)=1;     %为z(v)赋初值1
end
s=[];       %s集合
s(1)=1;     %s集合的第1个元素为起点
u=s(1);
k=1;        %k记录集合s中点的数量

while k<n   %当集合s未包含所有元素的时候执行循环
 for i=1:n  %更新一遍l(v),z(v)
 if l(i)>l(u)+w(u,i)
 l(i)=l(u);
 z(i)=u;
 end
 end
%找l(i)中最小的v加入s集合
 ll=l;
 for i=1:n
 for j=1:k
     if i==s(j)
     ll(i)=inf;%去除掉已经在s集合中的点
     end 
 end
 end
[lv,v]=min(ll);%求最小的l(v)
s(k+1)=v;      %加入集合s
u=v;
k=k+1;
end

fprintf('最短路为:%1d->%1d->%1d->%1d\n',z(z(z(7))),z(z(7)),z(7),7)

