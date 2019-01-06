format ELF64 as 'o'

public  strlen

section '.text' executable
strlen:
        xor     rax, rax
        mov     rcx, -1
        cld
        repnz
        scasb
        lea     rax, [rcx+2]
        neg     rax
        ret
