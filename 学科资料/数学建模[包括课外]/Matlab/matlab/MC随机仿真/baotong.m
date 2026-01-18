%报童售报问题：一报童每天清晨从报刊发行中心购报纸后零售，报纸进货价为每份a元，售出为
%价为每份b元。若报童每天购进报纸n份，每天售出的报纸的份数是随机的，根据过去售报情况份数k
%服从参数为120的泊松（Poisson）分布
%试求报童每天清晨订购多少份报纸可以获得最大利润

clear all
a=0.35;                                                        % 报纸的进价
b=0.5;                                                         % 报纸的售价
lamda=120;                                                     % 泊松分布的参数
%模拟求解
m=45;                                                          % 随机数的个数
D=[];                                                          % 用来记录模拟利润
d=[];                                                          % 用来记录解析利润
P=poissrnd(lamda,1,m);                                         % 产生随机数
for i=60:lamda+20                                              % 对订量从60到120进行搜索
    dsum=0;
    for j=1:m                                                  % 模拟m个情况
    if P(j)>=i                                                 % 当报纸全部售出时
    dsum=dsum+i*(b-a);    
    elseif P(j)<i                                              % 当报纸未全部售出时
    dsum=dsum+P(j)*b-i*a;
    end
    end
    D=[D,dsum/m];
end
[Dmax,n]=max(D);
fprintf('应订购的报纸数量模拟n=%3d\n',n+59);
fprintf('可能获得的日最大利润模拟D=%4.3f\n',Dmax);


%解析求解
for i=60:lamda+20
    dsum=0;
    for j=0:i-1
    dsum=dsum+(j-i)*poisspdf(j,lamda);                          % poisspdf(j,lamda)  指参数为lamda的泊松分布律 k=j
    end
    dsum=i*(b-a)+b*dsum;
    d=[d,dsum];
end
[dmax,N]=max(d);
fprintf('应订购的报纸数量解析n=%3d\n',N+59);
fprintf('可能获得的日最大利润解析D=%4.3f\n',dmax);