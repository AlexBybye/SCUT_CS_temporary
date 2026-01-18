clear all
clc
%n皇后问题
n=8;
chess=zeros(n,n);
row=zeros(1,n);%记录n列被占用的情况
main=zeros(1,2*n-1);%记录主对角线的使用情况
deputy=zeros(1,2*n-1);%记录从对角线的使用情况
number=0;
[chess,row,main,deputy,number]=justtry(1,n,chess,row,main,deputy,number);