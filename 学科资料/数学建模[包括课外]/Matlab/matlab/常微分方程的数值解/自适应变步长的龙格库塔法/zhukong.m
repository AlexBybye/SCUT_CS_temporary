if exist('f.m')==0                                           
   disp('没有为方程创建名为f.m的函数文件,请参照下例建立它');
   disp('function z=f(x,y)');
   disp('z=y-2*x/y;');
   disp('并将该文件保存在work文件夹下');
end 

if exist('half.m')==0                                       
   disp('把work文件夹里没有half.m文件');
end 


eps=10^(-8);
x1=input('请输入初始点x1=');
y1=input('请输入初始条件y1=');
xn=input('请输入终止条件xn=');
h1=input('请输入初始步长h1=');
h=h1;

fprintf('h=%10.8f,x=%10.8f,y=%10.8f\n',h,x1,y1);          %输出初始条件

if h>abs(x1-xn)
    disp('初始步长取得过大，超过了求解区间的长度')
    break
end

while x1<=xn
    [u2,v2,h,err]=half(x1,y1,h);
    H=h;
    half_err=err;
    double_err=err;
    
    while half_err>eps                                    %当误差过大时，反复缩小步长
    H=h;
    [u2,v2,h,err]=half(x1,y1,H);
    half_err=err;
    end
    
    while double_err<eps                                  %当误差过小时，不断将步长增大
    H=2*H;
    [u2,v2,h,err]=half(x1,y1,H);
    double_err=err;
    end
    
    if double_err>=eps                                   %误差合适，最后进行调整运算                                   
        H=H/2;
        [u2,v2,h,err]=half(x1,y1,H);
    end
    
    fprintf('h=%10.8f,x=%10.8f,y=%10.8f\n',H,u2,v2);      %输出此点结果
    x1=u2;                                                %为下一节点的计算提供初始值
    y1=v2;
    h=h1;
    
end    