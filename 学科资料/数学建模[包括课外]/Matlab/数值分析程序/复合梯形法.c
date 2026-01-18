#include<stdio.h>
#include<math.h>
#define f(x) 4/(1+(x)*(x))
float g(int k)
{int i,total;
 total=1;
 for(i=1;i<=k;i++)
  total*=2;
 return total;
}

main()
{int i,k,k0,k1,tag;
 float a,b,e,e1,t[50],sum;
 scanf("%f,%f,%f,%d,%d",&a,&b,&e,&k0,&k1);
 t[0]=((b-a)*(f(1)-f(0)))/2;
 k=1;
 tag=0;
 do{sum=0;
    for(i=1;i<=g(k-1);i++)
     sum+=f(a+(2*i-1)*(b-a)/g(k));
    t[k]=t[k-1]/2+(b-a)*sum/g(k);
    if(k>=k1)
     {e1=fabs(t[k]-t[k-1]);
      if(e1<e)
       {printf("k=%d,T=%f\n",k,t[k]);
	tag=1;
       }
     }
    k++;
   }while(tag==0&&k<k0);
   if(tag==0||k>=k0)
    printf("error!\n");
}