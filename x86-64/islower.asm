format ELF64 as 'o'

public  islower

section '.text' executable
islower:
        mov     rax, 1
        cmp     rdi, $61
        jb      @f
        cmp     rdi, $7A
        ja      @f
        xor     rax, rax
@@:     ret
