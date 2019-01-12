format ELF64 as 'o'

public  strncat

extrn   strchr
extrn   strlen
extrn   strncpy

section '.text' executable
strncat:
        enter   32, 0
        mov     qword [rbp-8],  rdi
        mov     qword [rbp-16], rsi
        mov     qword [rbp-24], rdx
        xor     rsi, rsi
        call    strchr
        mov     qword [rbp-32], rax
        mov     rdi, qword [rbp-16]
        call    strlen
        cmp     qword [rbp-24], rax
        jbe     @f
        mov     qword [rbp-24], rax
@@:     mov     rdi, qword [rbp-32]
        mov     rsi, qword [rbp-16]
        mov     rdx, qword [rbp-24]
        call    strncpy
        mov     rax, qword [rbp-8]
        mov     rcx, qword [rbp-24]
        lea     rcx, [rax+rcx]
        mov     byte [rcx], 0
        leave
        ret
