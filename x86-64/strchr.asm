format ELF64 as 'o'

public  strchr

extrn   strlen
extrn   memchr

section '.text' executable
strchr:
        enter   16, 0
        mov     qword [rbp-8],  rdi
        mov     qword [rbp-16], rsi
        call    strlen
        mov     rdi, qword [rbp-8]
        mov     rsi, qword [rbp-16]
        mov     rdx, rax
        inc     rdx
        call    memchr
        leave
        ret
