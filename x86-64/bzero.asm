format ELF64 as 'o'

public  bzero
extrn   memset

section '.text' executable
bzero:
        mov     rdx, rsi
        xor     rsi, rsi
        call    memset
        ret
