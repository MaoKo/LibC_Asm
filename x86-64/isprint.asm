format ELF64 as 'o'

public  isprint
extrn   iscntrl

section '.text' executable
isprint:
        call    iscntrl
        btc     rax, 0
        ret
