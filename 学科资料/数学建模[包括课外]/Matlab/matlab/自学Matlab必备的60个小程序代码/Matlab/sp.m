function   simp=sp(a,b)
h=(b-a)/500;
f0=f3(a)+f3(b);
f1=0;
f2=0;
for i=1:499
    x=a+i*h;
    if(rem(i,2)==0)
        f2=f2+f3(x);
    else
        f1=f1+f3(x);
    end
end
simp=h*(f0+2*f2+4*f1)/3;
