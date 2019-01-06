format ELF64 as 'o'

public  strncmp

extrn   strlen
extrn   memcmp

section '.text' executable
strncmp:
        enter   32, 0
        mov     qword [rbp-8],  rdi
        mov     qword [rbp-16], rsi
        mov     qword [rbp-24], rdx
        call    strlen
        inc     rax
        mov     rdx, qword [rbp-24]
        cmp     rax, rdx
        cmovl   rdx, rax
        mov     rdi, qword [rbp-8]
        mov     rsi, qword [rbp-16]
        call    memcmp
        leave
        ret
