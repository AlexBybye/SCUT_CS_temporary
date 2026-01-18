%lny=lna+bx
clear all
y=[3.9 5.3 7.2 9.6 12.9 17.1 23.2 31.4 38.6 50.2 62.9 76.0];
%Y为列向量
Y=log(y');
x=1:12;
%X为两列
X=[ones(12,1),x'];
[b,bint,r,rint,stats]=regress(Y,X);
%b为参数的点估计
disp('b为参数的点估计')
b
%bint为参数的区间估计
disp('bint为参数的区间估计')
bint
%stats(1)为相关系数越接近1回归方程越显著
disp('stats(1)')
stats(1)
%stats(2)为F值越大回归越显著
disp('stats(2)')
stats(2)
%stats(3)为与F对应的概率P P<a时模型成立
disp('stats(3)')
stats(3)
%求均方误差根RMSE
a=exp(b(1));
yy=a.*exp(b(2).*x);
rmse=sqrt(sum((yy-y).^2)/12);
disp('rmse')
rmse
%写出表达式
fprintf('回归方程为y=%5.4f*exp(%5.4fx)',a,b(2))
%做回归图像
figure(1)
plot(x,y,'o',x,yy)
%做参差图
figure(2)
rcoplot(r,rint)

