;author: 60dhi

global _start

section .text

_start:
	;sys call no for exit is 1
	mov eax, 1
	;loading a non-zero return value into ebx
	mov ebx, 10
	int 0x80
