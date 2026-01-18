%四阶经典公式,微分方程为f.m

if exist('f.m')==0                                           %在星号处输入文件名(把星号改为文件名)
   disp('没有为方程创建名为f.m的函数文件,请参照下例建立它');
   disp('function z=f(x,y)');
   disp('z=y-2*x/y;');
   disp('并将该文件保存在work文件夹下');
end 

X1=input('请输入求解区间的左端点X1=');
Y1=input('请输入微分方程的初始条件Y1=（X=X1时Y的值）');
Xn=input('请输入求解区间的右端点Xn=');
h=input('请输入求解步长h=');

X=X1;
Y=Y1;                                                        %运算初始点
n=0;                                                         %节点序号变量置零

while X<=Xn-h
    K1=f(X,Y);
    K2=f(X+h/2,Y+K1*h/2);
    K3=f(X+h/2,Y+K2*h/2);
    K4=f(X+h,Y+K3*h);
    X=X+h;
    Y=Y+h*(K1+2*K2+2*K3+K4)/6;                               %四阶标准的龙格-库塔公式
    n=n+1;                                                   %节点序号加1

    fprintf('第%d个点的计算结果为X=%10.8f,Y=%10.8f\n',n,X,Y);
    plot(X,Y,'o')
    hold on
end