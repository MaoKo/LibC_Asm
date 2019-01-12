format ELF64 as 'o'

public  strncasecmp

extrn   strlen
extrn   tolower

section '.text' executable
strncasecmp:
        enter   32, 0
        xor     rax, rax
        test    rdx, rdx
        jz      .end
        mov     qword [rbp-8],  rdi
        mov     qword [rbp-16], rsi
        mov     qword [rbp-24], rdx
        mov     qword [rbp-32], 0
        call    strlen
        cmp     qword [rbp-24], rax
        jbe     @f
        inc     rax
        mov     qword [rbp-24], rax
@@:     mov     rsi, qword [rbp-8]
        movzx   rdi, byte [rsi]
        call    tolower
        mov     qword [rbp-32], rax
        mov     rsi, qword [rbp-16]
        movzx   rdi, byte [rsi]
        call    tolower
        xchg    rax, qword [rbp-32]
        sub     rax, qword [rbp-32]
        jnz     .end
        inc     qword [rbp-8]
        inc     qword [rbp-16]
        dec     qword [rbp-24]
        jnz     @b
.end:   leave
        ret
