#include<stdio.h>
void main()
{
   /*各种材料性能数据的录入（由程序员进行）*/
	int a,b,c,i,j,k=0,l,m,n;
    int d[9]={412,529,570,598,630,696,380,470,490};
	int e[9]={522,639,689,698,740,799,450,570,590};
	int f[9]={365,365,730,365,547,730,365,547,547};
	int g[9]={100,150,200,200,100,150,200,150,200};
	int h[9]={2000,2500,4100,3000,3446,5080,1500,3000,2790};
	int y[9];
	int z[9];
    /*用户需求的性能输入（由查询用户进行）*/
	printf("请输入您所需要材料的拉应力强度(Mpa)：\n");
    scanf("%d",&a);
	printf("请输入您所需要材料的切应力强度(Mpa)：\n");
    scanf("%d",&b);
    printf("请输入您所需要材料的弹性模量(Mpa)：\n");
    scanf("%d",&c);
    /*模型计算循环*/
    for(j=0;j<=8;j++) z[j]=(h[j])/(f[j]);
    /*筛选材料性能（选出性能可用的材料）循环*/
	for(n=0;n<=8;n++)
	{
	if((d[n]>=a)&&(e[n]>=b)&&(g[n]>=c)) 
	{
		y[k]=n;
	    k++;
     
	}
	}
    
	/*比较可用材料经济性循环*/
  for(l=0,m=z[(y[0])];l<=k-1;l++)
    {
		if(m>=z[(y[l])])
		{
			i=y[l];
			m=z[(y[l])];
	}
	}
    /*将性能满足，经济性最好的材料牌号交给查询用户*/
  switch(i)
    {
	case 0: printf("建议您选择Y20钢\n"); break;
    case 1: printf("建议您选择Y35钢\n"); break;
	case 2: printf("建议您选择Y40钢\n"); break;
	case 3: printf("建议您选择Y45钢\n"); break;
	case 4: printf("建议您选择Y50钢\n"); break;
	case 5: printf("建议您选择Y65钢\n"); break;
	case 6: printf("建议您选择Q235钢\n"); break;
	case 7: printf("建议您选择Q255钢\n"); break;
	case 8: printf("建议您选择Q275钢\n"); break;
    default:printf("没有合适材料\n");
	}
}
