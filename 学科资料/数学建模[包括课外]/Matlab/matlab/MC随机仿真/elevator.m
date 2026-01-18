%电梯排队问题的随机模拟
%一共有4部电梯 人流服从0到30的均匀分布
clc
clear all

QUETIME=0;                          %等待的顾客呆在队中的平均时间
quetotal=0;                         %花时间等待的顾客总数
remain=0;                           %下部电梯启程后还在等待的顾客数
flrvec=zeros(4,12);
selvec=zeros(4,12);

for i=1:500
between(i)=fix(rand*31);            %乘客i与i-1到达的时间间隔
floor(i)=fix(rand*11)+2;            %乘客i选择的楼层
wait(i)=0;                          %乘客i排队的等待时间
end

i=1;
Time=between(i);                    %时钟
for j=1:4
    Return(j)=Time;                 %每部电梯的可乘用时间  
end

while(1)
    if  Time>=4800
        break;
    end

if Time>=min(Return)                %如果现在不排队
    if Time>=Return(1)
    j=1;
    elseif Time>=Return(2)
    j=2;
    elseif Time>=Return(3)
    j=3;
    elseif Time>=Return(4)
    j=4;
    end

 occup(j)=0;                        %当前占用电梯j的乘客数
 first(j)=i;                        %第一个进入j电梯的人i   
 
 for k=1:12
 selvec(j,k)=0;                       %表示k层是否被选择
 flrvec(j,k)=0;                       %表示k层被选择了几次
 end

 selvec(j,floor(i))=1;
 flrvec(j,floor(i))=flrvec(j,floor(i))+1;
 occup(j)=occup(j)+1;
 
 while(1)
 if between(i+1)<=15&occup(j)<12
 i=i+1;                              %产生下一位乘客并调整时钟
 Time=Time+between(i);               
 for k=1:4
 if Time>=Return(k)
     Return(k)=Time;
 end
 end
 selvec(j,floor(i))=1;
 flrvec(j,floor(i))=flrvec(j,floor(i))+1;
 occup(j)=occup(j)+1;
 else
     break;
 end
 end
 limit=i;                             %最后一个进入可乘电梯的人
 
 for k=12:0-1:1    
 if selvec(j,k)==1
    MAX=k;
    break;
 end
 end
 Return(j)=Time+20*(MAX-1)+3*sum(flrvec(j,:))+10*sum(selvec(j,:))+15;                  

 i=i+1;
 Time=Time+between(i);  

else                                  %如果现在排队 Time
%初始化排队
    quecust=i;                        %队中第一位乘客的编号    
    queue=1;                          %当前等待一部电梯变成可乘用电梯排队的总长度
    arrive(i)=Time;                   %乘客开始排队时间
while 1
while 1
%产生下一个顾客
    i=i+1;   
    Time=Time+between(i);
    queue=queue+1;
    arrive(i)=Time;                  
if Time>=Return(1)
j=1; break;
elseif Time>=Return(2)
j=2; break;
elseif Time>=Return(3)
j=3; break;
elseif Time>=Return(4)
j=4; break;
else
    continue;
end
end

%排队中电梯来了
for k=1:12
selvec(j,k)=0;
flrvec(j,k)=0;
end
remain=queue-12;                      %继续呆在队伍中的人

if remain<=0
R=i;                                  %最后上电梯的人
occup(j)=queue;
else
R=quecust+11;
occup(j)=12;
end

C=0;
%电梯j承运乘客
for k=quecust:R
selvec(j,floor(k))=1;
flrvec(j,floor(k))=flrvec(j,floor(k))+1;
C=C+(Time-arrive(k));
end
QUETIME=QUETIME+C;                    %统计总等待时间
quetotal=quetotal+occup(j);           %统计总等待人数

first(j)=quecust;

if remain<=0
quene=0;
while(1)
 if between(i+1)<=15&occup(j)<12
 i=i+1;                              %产生下一位乘客并调整时钟
 Time=Time+between(i);               
 for k=1:4
 if Time>=Return(k)
     Return(k)=Time;
 end
 end
 selvec(j,floor(i))=1;
 flrvec(j,floor(i))=flrvec(j,floor(i))+1;
 occup(j)=occup(j)+1;
 else
     break;
 end
 end
 limit=i;                             %最后一个进入可乘电梯的人
 for k=12:0-1:1    
 if selvec(j,k)==1
    MAX=k;
    break;
 end
 end
 Return(j)=Time+20*(MAX-1)+3*sum(flrvec(j,:))+10*sum(selvec(j,:))+15;                  

 i=i+1;
 Time=Time+between(i);  
break;
else 
    limit=R;
 for k=12:0-1:1    
 if selvec(j,k)==1
    MAX=k;
    break;
 end
 end
 Return(j)=Time+20*(MAX-1)+3*sum(flrvec(j,:))+10*sum(selvec(j,:))+15;     
 i=i+1;
 Time=Time+between(i);  
queue=remain;
quecust=R+1;
end
end

end
end
i-queue
quetotal
QUETIME=QUETIME/quetotal