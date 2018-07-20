;author: 60dhi
;This program prints the hello world string using shellcode (stack technique)
;test1 = 'Hello World\n';  rev = test1[::-1]; rev.encode('hex');
;length of the string is 12
;0a2121646c726f57206f6c6c6548
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
	push 0x0a212164
	push 0x6c726f57
	push 0x206f6c6c
	push 0x65489090

;referencing the top of stack and storing it in ecx

	mov ecx, esp
	inc ecx 
	inc ecx	
;12 is the length of the string to be printed
        mov dl, 14

        int 0x80

        ; Exit the program gracefully
	xor eax, eax
        mov al, 0x1

	xor ebx, ebx
        mov bl, 0x5

        int 0x80
