format ELF64 as 'o'

public  isgraph
extrn   isprint

section '.text' executable
isgraph:
        xor     rax, rax
        cmp     rdi, $20
        jz      @f
        call    isprint
@@:     ret
