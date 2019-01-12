format ELF64 as 'o'

public  strncpy
extrn   stpncpy

section '.text' executable
strncpy:
        enter   16, 0
        mov     qword [rbp-8],  rdi
        call    stpncpy
        mov     rax, qword [rbp-8]
        leave
        ret
