function y=seidel(a,b,x0)
D=diag(diag(a));
U=-triu(a,1);
L=-tril(a,-1);
G=(D-L)\U;
f=(D-L)\b;
y=G*x0+f;n=1;
while norm(y-x0)>=1.0e-6
    x0=y;
    y=G*x0+f;
    n=n+1;
end
n
