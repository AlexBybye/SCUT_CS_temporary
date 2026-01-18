 #include<stdio.h>
 #include<math.h>
 #define N 100

 main()
 {int m,i,j;
  double sum,x,a[N];
  printf("input the x and the top exp:");
  scanf("%lf,%d",&x,&m);
  printf("\ninput the a[i](0<i<100):");
  for(i=0;i<=m;i++)
  {scanf("%lf",&t);
   a[i]=t;
  }
  sum=a[m];
  for(j=m-1;j>=0;j--)
  sum=x*sum+a[j];
  printf("\nthe result is:%lf\n",sum);
 }