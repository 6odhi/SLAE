#include<stdio.h>
#include<string.h>

unsigned char code[]=\
"\x31\xc0\xb0\x04\x31\xdb\xb3\x01\x31\xd2\x52\x68\x64\x21\x21\x0a\x68\x57\x6f\x72\x6c\x68\x6c\x6c\x6f\x20\x68\x90\x90\x48\x65\x89\xe1\x41\x41\xb2\x0e\xcd\x80\x31\xc0\xb0\x01\x31\xdb\xb3\x05\xcd\x80";

main()
{
	printf("Shellcode Length: %d\n", strlen(code));
	
	int(*ret)() = (int(*)())code;

	ret();

}


