%≤–»±∆Â≈Ã
board=zeros(100,100);
n=4;
size=2^n;
amount=0;
[board,amount]=cover(1,1,2,5,board,size,amount);
board(1:size,1:size)