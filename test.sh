#!/bin/sh
make asmwrap && \
(objdump -s -j .rodata asmwrap;objdump -M intel -d asmwrap) | less

#nasm -w +all -f elf64 -O2 -o test.o test.asm && \
#gcc -ggdb -o asmwrap asmwrap.c test.o && \
#(objdump -M intel -s -j .rodata -d asmwrap) | less
