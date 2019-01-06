format ELF64 as 'o'

public  memset

section '.text' executable
memset:
        mov     r8, rdi
        mov     rax, rsi
        mov     rcx, rdx
        cld
        rep
        lodsb
        mov     rax, r8
        ret
