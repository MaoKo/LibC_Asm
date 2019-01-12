format ELF64 as 'o'

public  strstr

extrn   strlen
extrn   strnstr

section '.text' executable
strstr:
        enter   16, 0
        mov     qword [rbp-8],  rdi
        mov     qword [rbp-16], rsi
        call    strlen
        mov     rdi, qword [rbp-8]
        mov     rsi, qword [rbp-16]
        mov     rdx, rax
        call    strnstr
        leave
        ret

