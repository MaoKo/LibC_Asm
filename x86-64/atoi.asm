format ELF64 as 'o'

public  atoi
extrn   strtol

section '.text' executable
atoi:
        xor     rsi, rsi
        mov     rdx, 10
        call    strtol
        ret
