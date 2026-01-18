#include<stdio.h>
#include<math.h>
#define f(x,y) (x)-(y)+1

main()
{int n,k;
 float a,b,y0,h,x,y,t[4];
 scanf("%f,%f,%f,%d",&a,&b,&y0,&n);
 h=(b-a)/n;
 x=a;y=y0;
 printf("%f,%f\n",x,y);
 k=1;
 do{t[0]=f(x,y);
    x=x+h/2;
    t[1]=f(x,y+h*t[0]/2);
    t[2]=f(x,y+h*t[1]/2);
    x=x+h/2;
    t[3]=f(x,y+h*t[2]);
    y=y+h*(t[0]+2*t[1]+2*t[2]+t[3])/6;        //Áú¸ñ¿âËþ¹«Ê½
    printf("%f,%f\n",x,y);
    k++;
   }while(k<=n);
}