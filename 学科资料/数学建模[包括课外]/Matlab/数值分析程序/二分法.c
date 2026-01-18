#include<stdio.h>
#include<math.h>

float f(float x)
{float y;
 y=x*x+2*x+1;
 return y;
}

main()
{float a,b,c,x;
 printf("%s","input three numbers:\n");
 scanf("%f%f%f",&a,&b,&c);
 while(fabs(b-a)>=c)
  {x=(a+b)/2;
   if(f(x)!=0)
    {if(f(a)*f(x)<0)
      b=x;
     else a=x;}
   else a=x,b=x;
  }
 printf("%f\n",(a+b)/2);
}

