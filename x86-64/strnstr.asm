format ELF64 as 'o'

public  strnstr

extrn   strlen
extrn   strncmp

section '.text' executable
strnstr:
        enter   32, 0
        mov     qword [rbp-8],  rdi
        mov     qword [rbp-16], rsi
        mov     qword [rbp-24], rdx
        mov     qword [rbp-32], rbx
        call    strlen
        cmp     qword [rbp-24], rax
        jae     @f
        mov     rax, qword [rbp-24]
@@:     mov     rbx, rax
        mov     rdi, qword [rbp-16]
        call    strlen
        test    rax, rax
        jnz     @f
        mov     rax, qword [rbp-8]
        jmp     .end
        mov     qword [rbp-24], rax
.lp:    cmp     rbx, qword [rbp-24]
        jl      .zero
        mov     rdi, qword [rbp-8]
        mov     rsi, qword [rbp-16]
        mov     rdx, rbx
        call    strncmp
        test    rax, rax
        jnz     @f
        mov     rax, qword [rbp-8]
        jmp     .end
@@:     dec     rbx
        inc     qword [rbp-8]
        jmp     .lp
.zero:  xor     rax, rax
.end:   pop     rbx
        leave
        ret
