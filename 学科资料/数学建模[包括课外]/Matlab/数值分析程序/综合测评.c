#include<stdio.h>
#include<math.h>

float g(float a,float b,float c,float d,float e,float f)
{float y;
 y=(a*36.0+b*35.0+c*65.0+d*48.0+e*21.0+f*18.0)/223.0;
 return y;
}

main()
{float a,b,c,d,e,f,num[5],max;
 int i,j,h,n;
 for(i=1;i<=4;i++)
  {printf("input your marks:\n");
   scanf("%f%f%f%f%f%f",&a,&b,&c,&d,&e,&f);
   printf("your average mark:");
   printf("[%d]\n",i);
   printf("%6.3f\n",g(a,b,c,d,e,f));
   num[i]=g(a,b,c,d,e,f);
  }
 for(j=1;j<=4;j++)
  {max=num[1];
   h=1;
   for(i=1;i<=4;i++)
    if(num[i]>=max)
     {max=num[i];
      h=i;
     }
    printf("%6.4f,%d\n",max,h);
    num[h]=0;
  }
}



