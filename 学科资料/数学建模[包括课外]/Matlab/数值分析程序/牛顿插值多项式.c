#include<stdio.h>
#include<math.h>

main()
{int i,j,k,n;
 float x[10],y[10],a,b,p;
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
 b=0;
 k=0;
 do{p=1;
    j=0;
    do
    {if(j!=k)
     p=p*(a-x[j])/(x[k]-x[j]);
     j++;
    }while(j<n);
    b=b+p*y[k];
    k++;
   }while(k<n);
 printf("x=%f,y=%f",a,b);
}