#include<stdio.h>
#include<math.h>

float f(float x)
{float y;
 y=sqrt(10/(4+x));
 return y;
}

main()
{float x0,x1,a;
 int k,N;
 k=0;
 scanf("%f,%f,%d",&x0,&a,&N);
 for(k=0;k<N;k++)
  {x1=f(x0);
   if(fabs(x1-x0)<a)
    {printf("%d,%f",k,x1);
     break;
    }
   else x0=x1;
  }
 if(k>=N)
  {printf("error");
  }
}