format ELF as 'o'

public  strcat

extrn   strchr
extrn   strcpy

section '.text' executable
strcat:
        push    {r0,lr}
        push    {r1}
        eor     r1, r1, r1
        bl      strchr
        pop     {r1}
        bl      strcpy
        pop     {r0,pc}

