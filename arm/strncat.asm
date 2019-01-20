format ELF as 'o'

public  strncat

extrn   strlen
extrn   strchr
extrn   strncpy

section '.text' executable
strncat:
        push    {r0-r2,lr}
        mov     r0, r1
        bl      strlen
        ldr     r2, [sp, #8]
        cmp     r2, r0
        movgt   r2, r0
        strgt   r2, [sp, #8]
        ldr     r0, [sp, #0]
        eor     r1, r1, r1
        bl      strchr
        ldr     r1, [sp, #4]
        ldr     r2, [sp, #8]
        eor     r3, r3, r3
        strb    r3, [r0, r2]
        bl      strncpy
        pop     {r0-r2,pc}

