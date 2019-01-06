format ELF64 as 'o'

public  strncpy

extrn   strlen
extrn   memcpy
extrn   memset

section '.text' executable
strncpy:
        enter   32, 0
        mov     qword [rbp-8],  rdi
        mov     qword [rbp-16], rsi
        mov     qword [rbp-24], rdx
        mov     qword [rbp-32], 0
        xchg    rdi, rsi
        call    strlen
        mov     rdx, qword [rbp-24]
        cmp     rax, rdx
        jb      @f
        sub     rdx, rax
        mov     qword [rbp-32], rdx
        mov     rdx, rax
@@:     mov     rdi, qword [rbp-8]
        mov     rsi, qword [rbp-16]
        call    memcpy
        mov     rdx, qword [rbp-32]
        test    rdx, rdx
        jz      @f
        mov     rdi, rax
        xor     rsi, rsi
        call    memset
@@:     mov     rax, qword [rbp-8]
        leave
        ret
