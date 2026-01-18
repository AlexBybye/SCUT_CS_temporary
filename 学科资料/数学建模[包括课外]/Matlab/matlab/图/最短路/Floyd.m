clear all
%图论最短路问题的Floyd算法
%邻接矩阵(点与点的关系)
w=[0,2,4,inf,inf,inf,inf;  
   2,0,inf,3,3,1,inf;
   4,inf,0,2,3,1,inf;                      
   inf,3,2,0,inf,inf,1;                    
   inf,3,3,inf,0,inf,3;
   inf,1,1,inf,inf,0,4;
   inf,inf,inf,1,3,4,0];
n=size(w,1);%n记录图中点数
D=w;        %D为距离矩阵
R=[];       %R为路径矩阵

for i=1:n
    for j=1:n
R(i,j)=j;   %为R矩阵赋初值
end
end

for k=1:n  

    for i=1:n %更新D,R
       for j=1:n
          if D(i,k)+D(k,j)<D(i,j) %判断是否满足插入条件  
          D(i,j)=D(i,k)+D(k,j);
          R(i,j)=k;
          end
       end
    end
end
D
R
