format ELF as 'o'

public  strchr

extrn   strlen
extrn   memchr

section '.text' executable
strchr:
        push    {r0,r1,lr}
        bl      strlen
        add     r2, r0, #1
        pop     {r0,r1}
        bl      memchr
        pop     {pc}

