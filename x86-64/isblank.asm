format ELF64 as 'o'

public  isblank

section '.text' executable
isblank:
        mov     rax, 1
        cmp     rdi, $20
        jz      @f
        cmp     rdi, $09
        jz      @f
        xor     rax, rax
@@:     ret
