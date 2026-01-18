#include<stdio.h>
#include<math.h>

float f(float x)
{float y;
 y=pow(x,3)-x-1;
 return y;
}

main()
{float x0,x1,x2,a;
 int k,N;
 k=0;
 scanf("%f,%f,%f,%d",&x0,&x1,&a,&N);
 for(k=0;k<N;k++)
  {x2=x1-f(x1)*(x1-x0)/(f(x1)-f(x0));
   if(fabs(x2-x1)<a)
    {printf("%d,%f",k,x2);
     break;
    }
   else x0=x1;
        x1=x2;
  }
 if(k>=N)
 {printf("error");
 }
}