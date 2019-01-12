format ELF64 as 'o'

public  isupper

section '.text' executable
isupper:
        xor     rax, rax
        cmp     rdi, 41h
        jb      @f
        cmp     rdi, 5Ah
        ja      @f
        mov     rax, 1
@@:     ret
