format ELF as 'o'

public  memmove
extrn   memcpy

section '.text' executable
memmove:
        push    {r0,lr}
        cmp     r1, r0
        beq     .end
        blt     .mmc
        sub     r0, r0, #1
        sub     r1, r1, #1
@@:     tst     r2, r2
        beq     .end
        sub     r2, r2, #1
        ldrb    r3, [r1, #1]!
        strb    r3, [r0, #1]!
        b       @b
.mmc:   bl      memcpy
.end:   pop     {r0,pc}

