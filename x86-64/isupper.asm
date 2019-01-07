format ELF64 as 'o'

public  isupper

section '.text' executable
isupper:
        mov     rax, 1
        cmp     rdi, 41h
        jb      @f
        cmp     rdi, 5Ah
        ja      @f
        xor     rax, rax
@@:     ret
