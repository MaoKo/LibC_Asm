format ELF as 'o'

public  memccpy

extrn   memchr
extrn   memcpy


section '.text' executable
memccpy:
        push    {r0-r4,lr}
        add     sp, sp, #4
        ldmfd   sp, {r0-r2}
        bl      memchr
        mov     r4, r0
        sub     sp, sp, #4
        ldmfd   sp, {r0-r3}
        mov     r2, r3
        tst     r4, r4
        beq     @f
        add     r4, r4, #1
        sub     r2, r4, r1
@@:     bl      memcpy
        add     sp, sp, #16
        mov     r0, r4
        pop     {r4,pc}
