format ELF64 as 'o'

public  bcopy
extrn   memmove

section '.text' executable
bcopy:
        call    memmove
        ret
