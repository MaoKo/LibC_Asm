format ELF64 as 'o'

public  strcat

extrn   strchr
extrn   strcpy

section '.text' executable
strcat:
        enter   16, 0
        mov     qword [rbp-8],  rdi
        mov     qword [rbp-16], rsi
        xor     rsi, rsi
        call    strchr
        mov     rdi, rax
        mov     rsi, qword [rbp-16]
        call    strcpy
        mov     rax, qword [rbp-8]
        leave
        ret
