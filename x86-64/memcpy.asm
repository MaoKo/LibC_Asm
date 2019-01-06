format ELF64 as 'o'

public  memcpy

section '.text' executable
memcpy:
        mov     rax, rdi
        test    rdx, rdx
        jz      @f
        cmp     rdi, rsi
        jz      @f
        mov     rcx, rdx
        cld
        rep
        movsb
@@:     ret
