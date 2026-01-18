close all;
clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%具体实例%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=-1;b=1;c=-1;d=1;
n=6;m=5;TOL=1e-10;
ITMAX=500;
%f=inline('x*exp(y)','x','y');
%ga=inline('0','x','y');gb=inline('2*exp(y)','x','y');
%gc=inline('x','x','y');gd=inline('exp(1)*x','x','y');
f=inline('2*pi^2*sin(pi*x)*sin(pi*y)','x','y');
ga=inline('0','x','y');gb=inline('0','x','y');
gc=inline('0','x','y');gd=inline('0','x','y');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%程序部分%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=(b-a)/n;
k=(d-c)/m;
x=linspace(a,b,n+1);
x=x(2:n);
y=linspace(c,d,m+1);
y=y(2:m);
u=zeros(n-1,m-1);
lmd=h^2/k^2;
mu=2*(1+lmd);
xx=[];
yy=[];
uu=[];
ture=[];
l=1;
while (l<=ITMAX)
     z=(-h*h*f(x(1),y(m-1))+ga(a,y(m-1))+lmd*gd(x(1),d)+...
	   lmd*u(1,m-2)+u(2,m-1))/mu;
     NORM=abs(z-u(1,m-1));
     u(1,m-1)=z;
     for i=2:n-2
         z=(-h*h*f(x(i),y(m-1))+lmd*gd(x(i),d)+u(i-1,m-1)+...
	        u(i+1,m-1)+lmd*u(i,m-2))/mu;
         if(abs(u(i,m-1)-z)>NORM)
	        NORM=abs(u(i,m-1)-z);
         end
	     u(i,m-1)=z;
     end
    z=(-h*h*f(x(n-1),y(m-1))+gb(b,y(m-1))+...
	  lmd*gd(x(n-1),d)+u(n-2,m-1)+lmd*u(n-1,m-2))/mu;
	  if(abs(u(n-1,m-1)-z)>NORM)
	     NORM=abs(u(n-1,m-1)-z);
      end
      u(n-1,m-1)=z;
	   for j=m-2:-1:2
	       z=(-h*h*f(x(1),y(i))+ga(a,y(j))+lmd*u(1,j+1)+...
	         lmd*u(1,j-1)+u(2,j))/mu;
	       if(abs(u(1,j)-z)>NORM)
		      NORM=abs(u(1,j)-z);
          end
          u(1,j)=z;
	    for i=2:n-2
	        z=(-h*h*f(x(i),y(j))+u(i-1,j)+lmd*u(i,j+1)+...
		      u(i+1,j)+lmd*u(i,j-1))/mu;
		    if( abs(u(i,j)-z)>NORM)
		       NORM=abs(u(i,j)-z);
           end
           u(i,j)=z;
       end
        z=(-h*h*f(x(n-1),y(j))+gb(b,y(j))+u(n-2,j)+...
	      lmd*u(n-1,j+1)+lmd*u(n-1,j-1))/mu;
	    if(abs(u(n-1,j)-z)>NORM)
	       NORM=abs(u(n-1,j)-z);
        end
         u(n-1,j)=z;  
     end
	   z=(-h*h*f(x(1),y(1))+ga(a,y(1))+lmd*gc(x(1),c)+...
	     lmd*u(1,2)+u(2,1))/mu;
	   if(abs(u(1,1)-z)>NORM)
	     NORM=abs(u(1,1)-z);
      end
      u(1,1)=z;
	   for i=2:n-2
	     z=(-h*h*f(x(i),y(1))+lmd*gc(x(i),c)+...
		   u(i-1,1)+lmd*u(i,2)+u(i+1,1))/mu;
		if(abs(u(i,1)-z)>NORM)
		   NORM=abs(u(i,1)-z);
        end
         u(i,1)=z;
    end
	       z=(-h*h*f(x(n-1),y(1))+gb(b,y(1))+lmd*gc(x(n-1),c)+...
		     u(n-2,1)+lmd*u(n-1,2))/mu;
		 if(abs(u(n-1,1)-z)>NORM)
		    NORM=abs(u(n-1,1)-z);
         end
         u(n-1,1)=z;
         if(NORM<=TOL)
           for i=1:n-1
               for j=1:m-1
                   xx=[xx,x(i)];
                   yy=[yy,y(j)];
                   uu=[uu,u(i,j)];
                   %tur(i,j)=x(i)*exp(y(j));
                   tur(i,j)=-sin(pi*x(i))*sin(pi*y(j));
                   ture=[ture,tur(i,j)];
               end
           end
           break;
       end
       l=l+1;
end
     re=[xx'      yy'        uu'        ture']
     
%%%%%%%%%%%%%%%%%%%%%%%问题%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [Y,X]=meshgrid(y,x);
    mesh(X,Y,u)
