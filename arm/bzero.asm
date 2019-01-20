format ELF as 'o'

public  bzero
extrn   memset

section '.text' executable
bzero:
        push    {lr}
        mov     r2, r1
        eor     r1, r1, r1
        bl      memset
        pop     {pc}

