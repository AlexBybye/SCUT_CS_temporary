% w总等待时间  
%c(i)第i个顾客到达时刻 come 
%b(i)第i个顾客开始服务的时刻 begin
%e(i)第i个顾客结束服务的时刻 end

%模拟一天
clear all
c(1)=exprnd(10);             %第一个顾客到达
b(1)=c(1);
i=1;
w=0;
while b(i)<=480
e(i)=b(i)+unifrnd(4,15);     
w=w+b(i)-c(i);               %累计等待时间
i=i+1;
c(i)=c(i-1)+exprnd(10);      %新的顾客到达
b(i)=max([c(i),e(i-1)]);     %开始新的服务时间
end
w/(i-1)
i-1


%模拟一百天
for j=1:100
c(1)=exprnd(10);             %第一个顾客到达
b(1)=c(1);
i=1;
w(j)=0;
while b(i)<=480
e(i)=b(i)+unifrnd(4,15);     
w(j)=w(j)+b(i)-c(i);         %累计等待时间
i=i+1;
c(i)=c(i-1)+exprnd(10);      %新的顾客到达
b(i)=max([c(i),e(i-1)]);     %开始新的服务时间
end
t(j)=w(j)/(i-1);             %记录当天等待平均时间
m(j)=i-1;                    %记录当天服务人数
end
mean(t)
mean(m)
