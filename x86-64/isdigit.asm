format ELF64 as 'o'

public  isdigit

section '.text' executable
isdigit:
        mov     rax, 1
        cmp     rdi, 30h
        jb      @f
        cmp     rdi, 39h
        ja      @f
        xor     rax, rax     
@@:     ret
