format ELF64 as 'o'

public  ispunct

extrn   isgraph
extrn   isdigit

section '.text' executable
ispunct:
        enter   16, 0
        mov     qword [rbp-8], rdi
        call    isdigit
        test    rax, rax
        jz      @f
        xor     rax, rax
        jmp     .end
@@:     mov     rdi, qword [rbp-8]
        call    isgraph
.end:   leave
        ret
