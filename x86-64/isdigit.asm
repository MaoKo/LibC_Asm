format ELF64 as 'o'

public  isdigit

section '.text' executable
isdigit:
        xor     rax, rax     
        cmp     rdi, 30h
        jb      @f
        cmp     rdi, 39h
        ja      @f
        mov     rax, 1
@@:     ret
