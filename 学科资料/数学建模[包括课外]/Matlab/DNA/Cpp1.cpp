#include <stdio.h>
void main()
{
	char string[]={"cggttagggcaaaggttggatttcgacccagggggaaagcccgggacccgaacccagggctttagcgtaggctgacgctaggcttaggttggaacccggaa"},b;
float a[5]={0};
int i;





for(i=0;(b=string[i])!='\0';i++)
	{
	if(b=='a') a[1]++;
	else if(b=='c') a[2]++;
	else if(b=='g') a[3]++;
	else a[4]++;
	}

a[5]=a[1]+a[2]+a[3]+a[4];
    a[1]=a[1]/a[5];
    a[2]=a[2]/a[5];
    a[3]=a[3]/a[5];
    a[4]=a[4]/a[5];	

printf(" a=%f ,c=%f ,g=%f, t=%f ,",a[1],a[2],a[3],a[4]);


}
