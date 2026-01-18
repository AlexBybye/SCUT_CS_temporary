function y=check(i,j,maze)         
if (i<=8)&(j<=8)&(i>=1)&(j>=1) 
y=1;    
else
y=0;    
return
end
if maze(i,j)==1|maze(i,j)==-1
y=0;        
return
end