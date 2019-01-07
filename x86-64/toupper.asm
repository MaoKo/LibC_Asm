format ELF64 as 'o'

public  toupper
extrn   islower

section '.text' executable
toupper:
        enter   16, 0
        mov     qword [rbp-8], rdi
        call    islower
        test    rax, rax
        jz      @f
        xor     qword [rbp-8], $20
@@:     mov     rdi, qword [rbp-8]
        leave
        ret

