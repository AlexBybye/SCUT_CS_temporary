#include<stdio.h>
#include<math.h>

main()
{float a[10][10],b[10],s,t,e,sum;
 int i,j,k,n,m;
 printf("The top exp is ");
 scanf("%d",&n);
 for(i=0;i<n;i++)
  for(j=0;j<n;j++)
   scanf("%f",&a[i][j]);
 for(i=0;i<n;i++)
  scanf("%f",&b[i]);
 scanf("%f",&e);
 k=0;
 do{t=a[k][k];
    for(i=k;i<n;i++)
     {if(fabs(t)<fabs(a[i][k]))
       {t=a[i][k];
	m=i;
       }
      else m=k;
     }
     if(fabs(t)<e)
      printf("det A = 0\n");
     else {if(m!=k)
	    {for(j=0;j<n;j++)
	      {s=a[m][j];
	       a[m][j]=a[k][j];
	       a[k][j]=s;
	      }
	     s=b[m];
	     b[m]=b[k];
	     b[k]=s;
	    }
	   for(i=k+1;i<n;i++)
	    for(j=k+1;j<n;j++)
	     {a[i][k]=a[i][k]/a[k][k];
	      a[i][j]=a[i][j]-a[i][k]*a[k][j];
	      b[i]=b[i]-a[i][k]*b[k];
	     }
	  }
    k++;
   }while(k<n-2);
  if(fabs(a[n-1][n-1])<e)
   printf("det A = 0\n");
  else {b[n-1]=b[n-1]/a[n-1][n-1];
	for(i=n-2;i>=0;i--)
	 {sum=0;
	  for(k=i+1;k<n;k++)
	   {sum+=a[k][j]*b[j];}
	  b[i]=(b[i]-sum)/a[i][i];
	 }
       }
  for(i=0;i<n;i++)
   printf("%f\n",b[i]);
}