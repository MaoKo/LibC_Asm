format ELF64 as 'o'

public  strtol
extrn   strtoll

section '.text' executable
strtol:
        call    strtoll
        ret
