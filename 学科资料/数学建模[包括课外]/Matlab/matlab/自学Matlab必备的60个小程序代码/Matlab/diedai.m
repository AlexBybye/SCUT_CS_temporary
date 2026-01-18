x0=1.5;
TOL=10^-2;
N=10;
i=1;
while(i<=N)
    x=x-(x0^3+4*x0^2-10)/(3*x0^2+8*x0);
    if(abs(x-x0)<TOL)
        x
        i
    else
        i=i+1;
        x0=x;
    end
end

        
    