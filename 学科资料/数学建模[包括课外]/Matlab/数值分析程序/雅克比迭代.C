#include<stdio.h>
#include<math.h>

main()
{float a[10][10],b[10],x[10],y[10],e,sum,c;
 int i,j,n,l;
 printf("The top exp is ");
 scanf("%d",&n);
 printf("Now input array A\n");
 for(i=0;i<n;i++)
  for(j=0;j<n;j++)
   scanf("%f",&a[i][j]);
 printf("Now input array B first and then array X\n");
 for(i=0;i<n;i++)
  scanf("%f,%f",&b[i],&x[i]);
 printf("Now input e\n");
 scanf("%f",&e);
 l=0;
 do{for(i=0;i<n;i++)
     {sum=0;
      for(j=0;j<i;j++)
       sum+=a[i][j]*x[j];
      for(j=i+1;j<n;j++)
       sum+=a[i][j]*x[j];
      y[i]=(b[i]-sum)/a[i][i];
      l+=1;
     }
     c=fabs(x[0]-y[0]);
     for(i=0;i<n;i++)
      if(c<fabs(x[i]-y[i]))
       c=fabs(x[i]-y[i]);
     for(i=0;i<n;i++)
      x[i]=y[i];
   }while(c<e);
 printf("%d\n",l);
 for(i=0;i<n;i++)
  printf("%f\n",y[i]);
}