format ELF64 as 'o'

public  tolower
extrn   isupper

section '.text' executable
tolower:
        enter   16, 0
        mov     qword [rbp-8], rdi
        call    isupper
        test    rax, rax
        jz      @f
        xor     qword [rbp-8], $20
@@:     mov     rax, qword [rbp-8]
        leave
        ret

