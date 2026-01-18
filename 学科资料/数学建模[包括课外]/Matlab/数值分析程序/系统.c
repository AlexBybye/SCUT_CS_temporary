#include <stdio.h>

int main(void)
{

	int a,b,CHECK;
	printf("Input two nonzero intergers:");
	scanf("%d,%d",&a,&b);
	printf("%s%4d\n%s%4d\n%s%4d\n%s%4d\n%s%4d\n",
		"         a=",a,
		"         b=",b,
   		"       a/b=",a/b,
		"       a%b=",a%b,
		"     CHECK=",(a/b)*b+a%b-a
		);


	return 0;
}
