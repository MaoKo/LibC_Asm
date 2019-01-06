format ELF64 as 'o'

public  memmove
extrn   memcpy

section '.text' executable
memmove:
        mov     rax, rdi
        test    rdx, rdx
        jz      .end
        cmp     rdi, rsi
        jz      .end
        ja      @f
        std
        mov     rcx, rdx
        lea     rdi, [rdi+rcx-1]
        lea     rsi, [rsi+rcx-1]
        rep
        movsb
        jmp     .end
@@:     call    memcpy
.end:   ret
