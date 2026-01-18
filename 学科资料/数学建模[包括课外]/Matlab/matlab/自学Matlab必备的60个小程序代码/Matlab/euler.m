function  A=euler(a,b,u0)
h=(b-a)/10;
t(1)=a;
u1(1)=u0;
u2(1)=u0;
for  i=2:11
     u1(i)=u1(i-1)+h*f1(t(i-1),u1(i-1));
     u2(i)=u2(i-1)+(h/2)*...
     (f1(t(i-1),u2(i-1))+f1(t(i-1)+h,u2(i-1)+h*f1(t(i-1),u2(i-1))));
     t(i)=a+i*h;
end
 
 A=[ t',u1',u2']
 plot(t,u1,'ro',t,u1,'g*')
 xlabel('t');
 ylabel('u');
 legend('欧拉法','改进欧拉法');
