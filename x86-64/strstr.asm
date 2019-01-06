format ELF64 as 'o'

public  strstr

extrn   strlen
extrn   strncmp

section '.text' executable
strstr:
        enter   32, 0
        mov     qword [rbp-8],  rdi
        mov     qword [rbp-16], rsi
        mov     qword [rbp-32], rbx
        call    strlen
        mov     rbx, rax
        mov     rdi, qword [rbp-16]
        call    strlen
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

