format ELF64 as 'o'

public exit

section '.text' executable

exit:
        mov     rax, 1
        xor     rdi, rdi
        syscall
