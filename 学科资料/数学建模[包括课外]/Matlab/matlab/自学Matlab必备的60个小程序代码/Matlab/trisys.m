function X=trisys(A,D,C,B);
N=length(B);
for k=2:N
    mult=A(k-1)/D(k-1);
    D(k)=D(k)-mult*C(k-1);
    B(k)=B(k)-mult*B(k-1);
end
X(N)=B(N)/D(N);
for k=N-1:-1:1
    X(k)=(B(k)-C(k)*X(k+1))/D(k)
end