format ELF64 as 'o'

public  strcmp

extrn   strlen
extrn   memcmp

section '.text' executable
strcmp:
        enter   32, 0
        mov     qword [rbp-8],  rdi
        mov     qword [rbp-16], rsi
        call    strlen
        mov     qword [rbp-24], rax
        mov     rdi, qword [rbp-16]
        call    strlen
        mov     rdx, qword [rbp-24]     
        cmp     rax, rdx
        cmovl   rdx, rax
        inc     rdx
        mov     rdi, qword [rbp-8]
        mov     rsi, qword [rbp-16]
        call    memcmp
        leave
        ret
