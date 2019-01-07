format ELF64 as 'o'

public  isalpha

extrn   islower
extrn   isupper

section '.text' executable
isalpha:
        enter   16, 0
        mov     qword [rbp-8], rdi
        call    islower
        test    rax, rax
        jnz     @f
        mov     rdi, qword [rbp-8]
        call    isupper
@@:     leave
        ret
