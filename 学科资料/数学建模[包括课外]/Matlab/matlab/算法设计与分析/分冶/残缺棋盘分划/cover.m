function [board,amount]=cover(i,j,k,l,board,size,amount)%(i,j)为左上角 (k,l)残缺 size为规模 amount为片数
if size==1
    return
end
amount=amount+1;
size=size/2;
if (k<size+i)&(l<size+j)%残缺位于左上棋盘  
board(size+i-1,size+j)=amount;board(size+i,size+j)=amount;board(size+i,size+j-1)=amount;%放置
[board,amount]=cover(i,j,k,l,board,size,amount);[board,amount]=cover(i,j+size,size+i-1,j+size,board,size,amount);
[board,amount]=cover(size+i,size+j,size+i,size+j,board,size,amount);[board,amount]=cover(i+size,j,i+size,j+size-1,board,size,amount);
elseif (k>=size+i)&(l<size+j)%残缺位于左下棋盘
board(size+i-1,size+j)=amount;board(size+i,size+j)=amount;board(size+i-1,size+j-1)=amount;%放置
[board,amount]=cover(i+size,j,k,l,board,size,amount);[board,amount]=cover(i,j+size,size+i-1,j+size,board,size,amount);
[board,amount]=cover(size+i,size+j,size+i,size+j,board,size,amount);[board,amount]=cover(i,j,i+size-1,j+size-1,board,size,amount);
elseif (k<size+i)&(l>=size+j)%残缺位于右上棋盘
board(size+i,size+j-1)=amount;board(size+i,size+j)=amount;board(size+i-1,size+j-1)=amount;%放置
[board,amount]=cover(i,j+size,k,l,board,size,amount);[board,amount]=cover(i,j,i+size-1,j+size-1,board,size,amount);
[board,amount]=cover(size+i,size+j,size+i,size+j,board,size,amount);[board,amount]=cover(i+size,j,i+size,j+size-1,board,size,amount);
elseif (k>=size+i)&(l>=size+j)%残缺位于右下棋盘
board(size+i,size+j-1)=amount;board(size+i-1,size+j)=amount;board(size+i-1,size+j-1)=amount;%放置
[board,amount]=cover(size+i,size+j,k,l,board,size,amount);[board,amount]=cover(i,j+size,size+i-1,j+size,board,size,amount);
[board,amount]=cover(i,j,i+size-1,j+size-1,board,size,amount);[board,amount]=cover(i+size,j,i+size,j+size-1,board,size,amount);
end

end