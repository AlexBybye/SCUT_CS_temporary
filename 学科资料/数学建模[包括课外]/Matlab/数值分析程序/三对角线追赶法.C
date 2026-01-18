#include<stdio.h>
#include<math.h>

main()
{int i,j,k,n;
 float d[10][10],g[10],a[10],b[10],c[10],x[10],y[10],f[10];
 printf("the top exp is ");
 scanf("%d",&n);
 scanf("%f,%f,%f,%f",&d[0][0],&d[0][1],&d[n-1][n-2],&d[n-1][n-1]);
 for(i=1;i<n-1;i++)
  for(j=i-1;j<=i+1;j++)
   scanf("%f",&d[i][j]);
 for(i=0;i<n;i++)
  scanf("%f",&g[i]);
 for(i=1;i<n-1;i++)
  a[i]=d[i][i-1];
 for(i=0;i<n;i++)
  b[i]=d[i][i];
 for(i=0;i<n-1;i++)
  c[i]=d[i][i+1];
 f[0]=c[0]/b[0];
 for(k=1;k<n-1;k++)
  f[k]=c[k]/(b[k]-a[k]*f[k-1]);
 y[0]=g[0]/b[0];
 for(i=1;i<n;i++)
  y[i]=(g[i]-a[i]*y[i-1])/(b[i]-a[i]*f[i-1]);
 x[n-1]=y[n-1];
 for(i=n-2;i>=0;i--)
  x[i]=y[i]-f[i]*x[i+1];
 for(i=0;i<n;i++)
  printf("%f\n",x[i]);
}
