#!/bin/bash

nasm -f elf "$1.asm"
ld -lc --dynamic-linker /lib/i386-linux-gnu/ld-linux.so.2 -m elf_i386 -o "$1.tmp" "$1.o"
objcopy --writable-text --set-section-flags .text=CONTENTS,ALLOC,LOAD,CODE "$1.tmp" "$1.elf"
../writable-text "$1.elf"
objdump -M intel -d "$1.elf" > "$1".disasm
"./$1.elf"
