%图论二部图最大匹配匈牙利算法
m=5;%X中有5个元素
n=5;%Y中有5个元素
%横坐标表示X中的元素,列坐标表示Y中的元素,0代表非邻接,1代表邻接
A=[0,1,1,0,0;
   1,1,0,1,1;
   0,1,1,0,0;
   0,1,1,0,0;
   0,0,0,1,1];
M=zeros(m,n);%M表示匹配

%求初始匹配M
for i=1:m 
    for j=1:n 
        if A(i,j)==1
            M(i,j)=1;
            break;
        end;
    end 
    if M(i,j)==1
        break;
    end
end %获得仅含一条边的初始匹配

while 1 

for i=1:m 
    x(i)=0;
end %将记录X中点的标号和标记*
for i=1:n 
    y(i)=0;
end %将记录Y中点的标号和标记*

%将X中M的所有非饱和点都给以标号0和标记*,程序中用n+1表示0标号,标号为负数时表示标记*
for i=1:m 
    pd=1; %寻找X中M的所有非饱和点
for j=1:n 
    if M(i,j)==1 
        pd=0;
    end;
end
if pd==1 
    x(i)=-n-1;
end
end 
pd=0;

while 1 
    xi=0;
%假如X中存在一个既有标号又有标记*的点,则任取X中一个既有标号又有标记*的点xi
for i=1:m 
    if x(i)<0 
        xi=i;
        break;
    end;
end

if xi==0
    pd=1;
    break;
end %假如X中所有有标号的点都已去掉了标记*, 算法终止

x(xi)=x(xi)*(-1);%去掉xi的标记*
k=1;
%对与xi邻接且尚未给标号的yj都给以标号i
for j=1:n 
    if A(xi,j)&&y(j)==0
        y(j)=xi;
        yy(k)=j;
        k=k+1;
    end;
end

if k>1
   k=k-1;

for j=1:k 
    pdd=1;
for i=1:m 
    if M(i,yy(j))==1
        x(i)=-yy(j);
        pdd=0;
        break;
    end
end %将yj在M中与之邻接的点xk(即xkyj∈M),给以标号j和标记*
if pdd==1%如果yjM-非饱和之直接逆向返回 
    break;
end
end

if pdd==1
    k=1;
    j=yy(j);%yj不是M的饱和点
while 1 
    P(k,2)=j;
    P(k,1)=y(j);
    j=abs(x(y(j)));%任取M的一个非饱和点yj,逆向返回
if j==n+1 
    break;
end %找到X中标号为0的点时结束,获得M-增广路P
k=k+1;
end

for i=1:k
    if M(P(i,1),P(i,2))==1
        M(P(i,1),P(i,2))=0;%将匹配M 在增广路P中出现的边去掉
    else
        M(P(i,1),P(i,2))=1;
    end
end %将增广路P中没有在匹配M中出现的边加入到匹配M中
break;
end
end
end

if pd==1 
    break;
end;
end %假如X中所有有标号的点都已去掉了标记*, 算法终止
M %显示最大匹配M