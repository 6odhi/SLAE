;author: 60dhi
;This program makes a execve syscall and invokes a /bin/sh shell using esp register/stack
;0x68732f6e69622f2f   --> hex encode of //bin/sh in reverse
global _start

section .text

_start:

	;PUSH the first null
	xor eax, eax	 
	push eax

	;PUSH //bin/sh
	push 0x68732f6e
	push 0x69622f2f

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




