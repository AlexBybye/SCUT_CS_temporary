%Langrange≤Â÷µ∑®
function y=Langrange(x1,y1,x);
m=length(x);
n=length(x1);
for i=1:m
    y(i)=0;
    for j=1:n
        l=1;
        for k=1:n
            if (k~=j)
                l=(x(i)-x1(k))*l/(x1(j)-x1(k));
            end
        end 
        y(i)=y(i)+l*y1(j);
        j=j+1;
    end   
end
%x1=[0,pi/6,pi/4,pi/3,pi/2];
%y1=[0,0.5,sqrt(2)/2,sqrt(3)/2,1];
%x=pi/5;
    
            
            