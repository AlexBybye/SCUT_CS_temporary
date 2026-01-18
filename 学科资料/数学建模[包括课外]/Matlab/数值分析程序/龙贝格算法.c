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
{int k0,k1,k,tag,i;
 float a,b,e,e1,t[50],s[50],c[50],r[50],sum;
 scanf("%f,%f,%f,%d,%d",&a,&b,&e,&k0,&k1);
 t[0]=(b-a)*(f(0)+f(1))/2;
 k=1;
 tag=0;
 do{if(k==1)
     {t[1]=t[0]/2+(b-a)*f(a+(b-a)/2)/2;
      s[0]=(4*t[1]-t[0])/3;
     }
    if(k==2)
     {t[2]=t[1]/2+(b-a)*(f(a+(b-a)/4)+f(a+3*(b-a)/4))/4;
      s[1]=(4*t[2]-t[1])/3;
      c[0]=(16*s[1]-s[0])/15;
     }
    if(k>=3)
     {sum=0;
      for(i=1;i<=g(k-1);i++)
       sum+=f(a+(2*i-1)*(b-a)/g(k));
      t[k]=t[k-1]/2+(b-a)*sum/g(k);
      s[k-1]=(4*t[k]-t[k-1])/3;
      c[k-2]=(16*s[k-1]-s[k-2])/15;
      r[k-3]=(64*c[k-2]-c[k-3])/63;
     }
    if(k>=k1)
     {e1=fabs(r[k-3]-r[k-4]);
      if(e1<e)
       {printf("k=%d,T=%f\n",k,r[k-3]);
	tag=1;
       }
     }
    k++;
   }while(tag==0&&k<k0);
  if(tag==0||k>=k0)
   printf("error!\n");
}