#include<stdio.h>
#include<math.h>
float f(float a)
{float b;
 b=pow(2,-a);
 return b;
}

main()
{float x0,x1,e,y,z;
 int k;
 scanf("%f,%f",&x0,&e);
 for(k=0;k<100;k++)
  {y=f(x0);
   z=f(y);
   x1=x0-(y-x0)*(y-x0)/(z-2*y+x0);
   if(fabs(x1-x0)<e)
    {printf("%f",x1);
     break;
    }
   else x0=x1;
  }
}
