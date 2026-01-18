a=0;b=1;N=10;
h=(b-a)/N;
T(1,1)=(b-a)*(ft(a)+ft(b))/2;
%while (i>1)
for i=2:10
       sum=0;
       for k=1:2^(i-2)
           sum=sum+ft(a+(2*k-1)*(b-a)/2^(i-1));
       end
           T(1,i)=(T(1,i-1)+(b-a)*sum/(2^(i-2)))/2;
       for m=1:i
           for k=2:i-m+1
               T(m+1,k-1)=(4^m*T(m,k)-T(m,k-1))/(4^m-1);
                
           end
           
       end
                 
end
       