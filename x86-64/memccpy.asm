format ELF64 as 'o'

public  f_memccpy

extrn   memchr
extrn   memcpy

section '.text' executable
f_memccpy:
        enter   32, 0
        mov     qword [rbp-8],  rdi
        mov     qword [rbp-16], rsi
        mov     qword [rbp-24], rdx
        mov     qword [rbp-32], rcx
        mov     rdi, rsi
        mov     rsi, rdx
        mov     rdx, rcx
        call    memchr
        test    rax, rax
        setz    cl
        mov     byte [rbp-24], cl
        jz      @f
        lea     rdx, [rax+1]
        sub     rdx, qword [rbp-16]
        mov     qword [rbp-32], rdx
@@:     mov     rdi, qword [rbp-8]
        mov     rsi, qword [rbp-16]
        mov     rdx, qword [rbp-32]
        call    memcpy
        add     rax, qword [rbp-32]
        xor     rcx, rcx
        cmp     byte [rbp-24], 1
        cmovz   rax, rcx
        leave
        ret
