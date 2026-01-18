function [chess,row,main,deputy,number]=justtry(i,n,chess,row,main,deputy,number);
for k=1:8
if row(k)==0&main(i-k+n)==0&deputy(i+k-1)==0%此棋盘可继续放子
    chess(i,k)=1;
    row(k)=1;
    main(i-k+n)=1;
    deputy(i+k-1)=1;
    if i==8%如果棋盘搜索结束   
        number=number+1
        chess
    else%没有结束继续深搜
    [chess,row,main,deputy,number]=justtry(i+1,n,chess,row,main,deputy,number);%递归
    end
    chess(i,k)=0;%回溯
    row(k)=0;
    main(i-k+n)=0;
    deputy(i+k-1)=0;
end
end