%Newton≤Â÷µ∑®
function y=Newton(x1,y1,x);
m=length(x);
n=length(x1);
for i=2:n
    for j=n:-1:i
        y1(j)=(y1(j)-y1(j-1))/(x1(j)-x1(j-i+1));
    end
end
for j=1:m
    p(j)=y1(1);
    for k=2:n
        l=1;   
        for i=1:k-1
            l=l*(x(j)-x1(i));
       end
    p(j)=p(j)+y1(k)*l;
   end
end
re=[x'  p']
