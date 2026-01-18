#include<stdio.h>
#include<math.h>

float f(float x)
{float y;
 y=pow(x,3)-x-1;
 return y;
}

float g(float x)
{float y;
 y=3*pow(x,2)-1;
 return y;
}

main()
{float x0,x1,b,e,a,x;
 int k;
 scanf("%f,%f",&x0,&a);
 k=0;
 if(fabs(g(x0))<a)
 {printf("error");
 }else
  e=1.00;
 while(fabs(f(x0))>=a)
 {do{x1=x0-e*f(x0)/g(x0);
     b=x0;
     x0=x1;
     e=e/2.00;
    }while(fabs(f(x1))>=fabs(f(b)));
  k+=1;e=1.00;
 }
 x=x0;
 printf("%d,%f",k,x);
}
