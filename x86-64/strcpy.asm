format ELF64 as 'o'

public  strcpy
extrn   stpcpy

section '.text' executable
strcpy:
        enter   16, 0
        mov     qword [rbp-8],  rdi
        call    stpcpy
        mov     rax, qword [rbp-8]
        leave
        ret

