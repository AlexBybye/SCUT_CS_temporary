#include<stdio.h>
#include<math.h>
#define f(x) (x)/(4+(x)*(x))

main()
{int k,n;
 float a,b,h,s,x;
 scanf("%f,%f,%d",&a,&b,&n);
 h=(b-a)/(2*n);
 x=a;
 s=f(x)-f(b);
 k=1;
 do
 {x=x+h;s=s+4*f(x);
  x=x+h;s=s+2*f(x);
  k++;
 }while(k<=n);
 s=(s*h)/3;
 printf("s=%f\n",s);
}