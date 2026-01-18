clear all
clc
%n皇后问题
n=8;
chess=zeros(1,n);
for i=1:n%排列树
chess(i)=i;
end
main=zeros(1,2*n-1);%记录主对角线的使用情况
deputy=zeros(1,2*n-1);%记录从对角线的使用情况
number=0;
[chess,main,deputy,number]=justtry(1,n,chess,main,deputy,number);