function s=trapr1(f,a,b,n)
h=(b-a)/n;
s=0;
for k=1:n-1
    x=a+h*k;
    s=s+feval(f,x);
end
s=h*(feval(f,a)+feval(f,b))/2+h*s;
    