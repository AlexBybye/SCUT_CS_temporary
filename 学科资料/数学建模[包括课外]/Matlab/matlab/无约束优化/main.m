clear all
%无约束优化的经典算法与非经典算法比较
%使用rosenbrock函数,理论极值为0
if exist('rosenbrock.m')==0                                       
   disp('没有为方程创建名为rosenbrock.m的函数文件,请建立它');
end 

%画图
[x,y]=meshgrid(-1:0.05:1,-1:0.05:1);
z=100*(y-x.^2).^2+(1-x).^2;
surf(x,y,z)

%经典算法:
[x1,fval1,exitflag1,output1]=fminunc('rosenbrock',[0,0]);%初始点为(0,0)
%x为解
%fval为目标函数x处的值
%exitflag>0表示函数已收敛到x处
%output中:Iterations表示迭代次数
%         Algorithm表示采用算法
%         FuncCount表示函数评价次数

%遗传算法
%调整最大允许的代数1万代,种群规模为200
options=gaoptimset('Generations',10000,'PopulationSize',200);
%设置两个变量,限制0<=x1,x2<=2
[x2,fval2,exitflag2,output2]=ga(@rosenbrock,2,[1,0;0,1;-1,0;0,-1],[2;2;0;0],[],[],[],[],[],options);
%exiflag>0表示求解成功
