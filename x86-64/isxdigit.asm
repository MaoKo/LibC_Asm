format ELF64 as 'o'

public  isxdigit
extrn   isdigit

section '.text' executable
isxdigit:
        mov     rax, 1
        cmp     rdi, 41h
        jb      @f
        cmp     rdi, 46h
        ja      @f
        jmp     .end
@@:     cmp     rdi, 61h
        jb      @f
        cmp     rdi, 66h
        ja      @f
        jmp     .end
@@:     call    isdigit
.end:   ret
