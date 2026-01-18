#include<stdio.h>
#include<math.h>
#define f(x,y) (x)-(y)+1

main()
{int k,n;
 float a,b,h,y0,x,y,t[2];
 scanf("%f,%f,%f,%d",&a,&b,&y0,&n);
 h=(b-a)/n;
 x=a;y=y0;
 printf("%f,%f\n",x,y);
 k=1;
 do{t[0]=y+h*f(x,y);
    x=x+h;
    t[1]=y+h*f(x,t[0]);
    y=(t[0]+t[1])/2;
    printf("%f,%f\n",x,y);
    k++;
   }while(k<=n);
}