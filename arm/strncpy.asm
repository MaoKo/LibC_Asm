format ELF as 'o'

public  strncpy

extrn   strlen
extrn   memcpy
extrn   bzero

section '.text' executable
strncpy:
        push    {r0-r2,r4,lr}
        mov     r0, r1
        bl      strlen
        mov     r3, r0
        ldr     r2, [sp, #8]
        cmp     r3, r2
        sublt   r3, r2, r3
        movlt   r2, r0
        eorge   r3, r3, r3
        str     r2, [sp, #8]
        ldmfd   sp, {r0,r1}
        push    {r3}
        bl      memcpy
        pop     {r3}
        pop     {r0-r2}
        mov     r4, r0
        tst     r3, r3
        beq     @f
        add     r0, r0, r2
        mov     r1, r3
        bl      bzero
@@:     mov     r0, r4
        pop     {r4,pc}

