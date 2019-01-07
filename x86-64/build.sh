#!/bin/bash

TARGET="libc_asm.a"
ASM="fasm"

if [[ "$1" == "clean" ]]; then
        rm -rf *.o
        rm -rf $TARGET
        exit
fi

for i in `ls *.asm`; do
        $ASM $i
done

ar rc $TARGET *.o
