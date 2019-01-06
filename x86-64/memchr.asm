format ELF64 as 'o'

public  memchr

section '.text' executable
memchr:
        mov     rax, rsi
        mov     rcx, rdx
        cld
        repnz
        scasb
        lea     rax, [rdi-1]
        cmovnz  rax, rcx
        ret
