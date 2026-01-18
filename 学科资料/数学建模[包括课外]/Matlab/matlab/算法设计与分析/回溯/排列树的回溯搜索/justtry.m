function [chess,main,deputy,number]=justtry(i,n,chess,main,deputy,number);
if i==9
number=number+1
chess
else
    for k=i:8
if main(i-chess(k)+n)==0&deputy(i+chess(k)-1)==0%此棋盘可继续放子(主，副对角线可放子)    
    t=chess(k);%交换
    chess(k)=chess(i);
    chess(i)=t;
    main(i-chess(k)+n)=1;
    deputy(i+chess(k)-1)=1;
    [chess,main,deputy,number]=justtry(i+1,n,chess,main,deputy,number);%递归
    t=chess(k);%回溯
    chess(k)=chess(i);
    chess(i)=t;
    main(i-chess(k)+n)=0;
    deputy(i+chess(k)-1)=0;
end
    end
end
end%function 