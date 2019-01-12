format ELF64 as 'o'

public  strcasecmp

extrn   strlen
extrn   strncasecmp

section '.text' executable
strcasecmp:
        enter   16, 0
        mov     qword [rbp-8],  rdi
        mov     qword [rbp-16], rsi
        call    strlen
        inc     rax
        mov     rdi, qword [rbp-8]
        mov     rsi, qword [rbp-16]
        mov     rdx, rax
        call    strncasecmp
        leave
        ret
