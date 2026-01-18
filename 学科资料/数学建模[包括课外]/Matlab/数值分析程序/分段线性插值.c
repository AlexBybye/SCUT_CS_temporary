#include<stdio.h>
#include<math.h>

main()
{int e,h,i,j,k,n;
 float x[10],y[10],a,sum,total,e1,e2;
 printf("input n\n");
 scanf("%d",&n);
 printf("input X\n");
 for(i=0;i<=n;i++)
  scanf("%f",&x[i]);
 printf("input Y\n");
 for(i=0;i<=n;i++)
  scanf("%f",&y[i]);
 printf("input x\n");
 scanf("%f",&a);
 for(j=1;j<=n;j++)
  if(x[j-1]<=a&&a<=x[j])
   e=j;
  if(e==1)
   h=j;
  else if(e==n)
	h=j-1;
       else {e1=fabs(a-x[j-2]);
	     e2=fabs(a-x[j+1]);
	     if(e1<e2)
	      h=j-1;
	     else h=j;}
 sum=0;
 for(k=h-1;k<=h+1;k++)
  {total=1;
   for(j=h-1;j<k;j++)
    total*=((a-x[j])/(x[k]-x[j]));
   for(j=k+1;j<=h+1;j++)
    total*=((a-x[j])/(x[k]-x[j]));
   sum+=y[k]*total;
  }
 printf("x=%f,L=%f",a,sum);
}