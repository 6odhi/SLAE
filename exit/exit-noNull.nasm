;author: 60dhi

global _start

section .text

_start:
	;xoring eax with itself to contain all zeroes in it
	xor eax, eax
	;sys call no for exit is 1
	mov al, 1

	xor ebx, ebx
	;loading a non-zero return value into ebx
	mov bl, 10

	int 0x80
