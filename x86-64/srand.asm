format ELF64 as 'o'

public  srand
public  __seed

section '.data' writable
__seed: dq 1

section '.text' executable
srand:
        mov     qword [__seed], rdi
        ret
