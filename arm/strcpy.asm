format ELF as 'o'

public  strcpy

extrn   strlen
extrn   memcpy

section '.text' executable
strcpy:
        push    {r0,r1,lr}
        mov     r0, r1
        bl      strlen
        add     r2, r0, #1
        pop     {r0,r1}
        bl      memcpy
        pop     {pc}
