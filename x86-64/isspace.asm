format ELF64 as 'o'

public  isspace
extrn   isblank

section '.text' executable
isspace:
        mov     rax, 1
        mov     rcx, $0A
@@:     cmp     rdi, rcx
        jz      @f
        inc     rcx
        cmp     rcx, $0E
        jb      @b
        call    isblank
@@:     ret
