format ELF64 as 'o'

public  swab

section '.text' executable
swab:
        cmp     rdx, 0
        jl      .end
        and     rdx, not 1
@@:     mov     ax, word [rdi]
        xchg    ah, al
        mov     word [rsi], ax
        add     rdi, 2
        add     rsi, 2
        sub     rdx, 2
        test    rdx, rdx
        jnz     @b
.end:   ret
