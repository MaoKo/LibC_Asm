format ELF64 as 'o'

public  strcpy

extrn   strlen
extrn   memcpy

section '.text' executable
strcpy:
        enter   16, 0
        mov     qword [rbp-8],  rdi
        mov     qword [rbp-16], rsi
        xchg    rdi, rsi
        call    strlen
        mov     rdi, qword [rbp-8]
        mov     rsi, qword [rbp-16]
        mov     rdx, rax
        inc     rax
        call    memcpy
        leave
        ret
