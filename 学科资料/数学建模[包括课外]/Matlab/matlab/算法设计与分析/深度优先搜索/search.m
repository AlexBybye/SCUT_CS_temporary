function [total,maze]=search(i,j,maze,total);        
fx(1:4)=[0,1,-1,0];
fy(1:4)=[1,0,0,-1];
for k=1:4
newi=i+fx(k);
newj=j+fy(k);
if (newi<=8)&(newj<=8)&(newi>=1)&(newj>=1)&maze(newi,newj)==0
maze(newi,newj)=3;%此点已走
if newi==8&newj==8
total=total+1
maze
else
[total,maze]=search(newi,newj,maze,total);
end%if i+fx(k)==8&j+fy(y)==8
end%if (newi<=8)&(newj<=8)&(newi>=1)&(newj>=1)&maze(newi,newj)==0
end%for k=1:4
maze(i,j)=2;%for执行结束此点死路
end
