format ELF64 as 'o'

public  islower

section '.text' executable
islower:
        xor     rax, rax
        cmp     rdi, $61
        jb      @f
        cmp     rdi, $7A
        ja      @f
        mov     rax, 1
@@:     ret
