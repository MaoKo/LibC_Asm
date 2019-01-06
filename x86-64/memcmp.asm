format ELF64 as 'o'

public  memcmp

section '.text' executable
memcmp:
        mov     rcx, rdx
        cld
        repz
        cmpsb
        dec     rdi
        dec     rsi
        mov     al, byte [rdi]
        sub     al, byte [rsi]
        movzx   rax, al
        ret
