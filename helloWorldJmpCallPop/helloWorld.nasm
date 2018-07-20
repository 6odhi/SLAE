;author: 60dhi
;This program prints the hello world string using shellcode

global _start

section .text

_start:
	jmp short call_shellcode

shellcode:
	
	pop ecx
		
        ; Print hello world on the screen
	xor eax, eax
        mov al, 0x4

	xor ebx, ebx
        mov bl, 0x1

	xor edx, edx
        mov dl, 14

        int 0x80

        ; Exit the program gracefully
	xor eax, eax
        mov al, 0x1

	xor ebx, ebx
        mov bl, 0x5

        int 0x80


call_shellcode:
		call shellcode
       		message: db "Hello World !", 0xA




