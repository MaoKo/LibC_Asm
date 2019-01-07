format ELF64 as 'o'

public  f_rand
extrn   __seed

; Implement Linear Congruential Generator (LCG)

MODULUS         = 7FFFFFh
MULTIPLIER      = 1103515245
INCREMENT       = 12345

section '.text' executable
f_rand:
        mov     rax, MULTIPLIER
        mul     qword [__seed]
        jno     @f
        bsr     rcx, rdx
        inc     cl
        shr     rax, cl
        sub     cl, 64
        neg     cl
        shl     rdx, cl
        or      rax, rdx
        xor     rdx, rdx
@@:     add     rax, INCREMENT
        mov     qword [__seed], rax
        mov     rcx, MODULUS
        and     rax, rcx
        ret
