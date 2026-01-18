#include<stdio.h>
#include<math.h>
#define N 100

float f(float x)
{float y;
 y=x-cos(x);
 return y;
}

main()
{float x0,x1,a;
 int k;
 scanf("%f,%f",&x0,&a);
 for(k=0;k<N;k++)
  {x1=x0-(x0-cos(x0))/(1+sin(x0));
   if(fabs(x1-x0)<a)
    {printf("%f,%d",x1,k);
     break;
    }
   else x0=x1;
  }
 if(k>=N)
  {printf("error");
  }
}