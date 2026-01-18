clear all
clc
%max z=g1(x1)+g2(x2)+g3(x3)
%x1+x2+x3=n;0<=xi<=n

%算法：突出阶段的动态规划
%f1(x)=g1(x) 0<=x<=n
%fi(x)=max{gi(y)+fi-1(x-y)}  0<=x<=n,0<=y<=n 

%数据结构
n=7;%总金额
m=3;%阶段数
income=[0,0.11,0.13,0.15,0.21,0.24,0.30,0.35;
        0,0.12,0.16,0.21,0.23,0.25,0.24,0.34;
        0,0.08,0.12,0.2,0.24,0.26,0.30,0.35];%三个项目的收益 income(k,i) k阶段投资i-1的收益
f=zeros(3,8);%f(k,i) 当前投资i-1最大收益
a=zeros(3,8);%a(i,j) 前i个工程投资j-1所获得最大利润时，给i项目的投资
f(1,:)=income(1,:);
a(1,:)=[0,1,2,3,4,5,6,7];

%动态规划
for k=2:m%阶段
    for j=0:n%到本阶段为止总投资量     
        for i=0:j%前一阶段投资量
            if f(k-1,i+1)+income(k,j-i+1)>=f(k,j+1)
            f(k,j+1)=f(k-1,i+1)+income(k,j-i+1);
            a(k,j+1)=j-i;%本阶段投资量
            end%if
        end%for
    end%for
end%for

%出结果
f(m,n+1)
out=n+1;
for i=m:-1:1
a(i,out)
out=out-a(i,out);
end%for