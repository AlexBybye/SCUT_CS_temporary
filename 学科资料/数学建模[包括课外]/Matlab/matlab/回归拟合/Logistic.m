clear all
y=[3.9 5.3 7.2 9.6 12.9 17.1 23.2 31.4 38.6 50.2 62.9...
    76.0 92.0 106.5 123.2 131.7 150.7 179.3 204.0 226.5 251.4 281.4]';
x=(1:22)';
beta0=[400,3.0,0.20]';
%非线性回归   'Logisfun'为回归模型
[beta,r,j]=nlinfit(x,y,'Logisfun',beta0);
%beta0为回归系数初始迭代点
%beta为回归系数
%r为残差

%输出拟合表达式:
fprintf('回归方程为y=%5.4f/(1+%5.4f*exp(-%5.4f*x))\n',beta(1),beta(1)/beta(2)-1,beta(3))

%求均方误差根:
rmse=sqrt(sum(r.^2)/22);
rmse

%预测和误差估计：
[Y,DELTA]=nlpredci('Logisfun',x,beta,r,j);
%DELTA为误差限
%Y为预测值(拟合后的表达式求值)
plot(x,Y,x,y,'o',x,Y+DELTA,':',x,Y-DELTA,':')
