#include<stdio.h>
#include<math.h>

main()
{float a[10][10],b[10],m[10][10],x[10],sum;
 int i,j,k,n;
 printf("the top exp:");
 scanf("%d",&n);
 printf("\n");
 for(i=0;i<n;i++)
  for(j=0;j<n;j++)
   scanf("%f",&a[i][j]);
    for(i=0;i<n;i++)
     scanf("%f",&b[i]);
      for(k=0;k<n-1;k++)
      {if(a[k][k]==0)
       printf("error");
	else for(i=k+1;i<n;i++)
	     {m[i][k]=a[i][k]/a[k][k];
	      a[i][k]=m[i][k];
	      b[i]=b[i]-m[i][k]*b[k];
	 for(j=k+1;j<n;j++)
	  a[i][j]=a[i][j]-m[i][k]*a[k][j];
      }}
 if(a[n-1][n-1]==0)
  printf("error");
 else x[n-1]=b[n-1]/a[n-1][n-1];
 b[n-1]=x[n-1];
 for(i=n-2;i>=0;i--)
 {sum=0;
  for(j=i+1;j<n;j++)
   {sum+=a[i][j]*x[j];}
    x[i]=(b[i]-sum)/a[i][i];
    b[i]=x[i];
   }
 for(i=0;i<n;i++)
 printf("%f\n",x[i]);
}
