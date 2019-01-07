format ELF64 as 'o'

public  iscntrl

section '.text' executable
iscntrl:
        mov     rax, 1
        cmp     rdi, $1F
        jle     @f
        cmp     rdi, $7F
        jz      @f
        xor     rax, rax
@@:     ret
