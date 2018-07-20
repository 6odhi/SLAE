;author: 60dhi
;This program prints the hello world string using shellcode (stack technique)
;test1 = 'Hello World\n';  rev = test1[::-1]; rev.encode('hex');
;length of the string is 12
;0a646c726f57206f6c6c6548
global _start

section .text

_start:

		
        ; Print hello world on the screen. 4 is the syscall
	xor eax, eax
        mov al, 0x4

	
	xor ebx, ebx
        mov bl, 0x1

	xor edx, edx
;the string must terminate with a null. Thus pushing 0x00000000. 
	push edx
;pushing the string on to the stack in reverse order
	push 0x0a646c72
	push 0x6f57206f
	push 0x6c6c6548	
;referencing the top of stack and storing it in ecx
	
	mov  ecx, esp 	
;12 is the length of the string to be printed
        mov dl, 12

        int 0x80

        ; Exit the program gracefully
	xor eax, eax
        mov al, 0x1

	xor ebx, ebx
        mov bl, 0x5

        int 0x80
