%Neville≤Â÷µ∑®
function y=Neville(x1,y1,x)
m=length(x);
n=length(x1);
for k=1:m
for i=2:n
    for j=2:i
        y1(i,j)=((x(k)-x1(i))*y1(i-1,j-1)-(x(k)-x1(i-j+1))*y1(i,j-1))/(x1(i-j+1)-x1(i));
    end
end
xi=x(k)
y1
end
        