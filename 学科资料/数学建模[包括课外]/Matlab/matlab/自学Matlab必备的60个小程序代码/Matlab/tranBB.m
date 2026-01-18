%平方法计算相似矩阵的传递闭包
r1=[1,0.1,0.2;0.1,1,0.3;0.2,0.3,1];
n=size(r1,1);
I=1;
while (I<=n)
 for i=1:n
     for j=1:n
         t=[];
         for k=1:n  
            mi(k)=min(r1(i,k),r1(k,j));
            t=[t,mi(k)];
        end
        tr(i,j)=max(t);
    end
end
 if(tr==r1)
    tr
    break;
 end
r1=tr;
I=I+1;
end
    

 