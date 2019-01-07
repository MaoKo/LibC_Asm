format ELF64 as 'o'

public  isalnum

extrn   isalpha
extrn   isdigit

section '.text' executable
isalnum:
        enter   16, 0
        mov     qword [rbp-8], rdi
        call    isalpha
        test    rax, rax
        jnz     @f
        mov     rdi, qword [rbp-8]
        call    isdigit
@@:     leave
        ret
