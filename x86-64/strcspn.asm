format ELF64 as 'o'

public  strcspn

extrn   strpbrk
extrn   strlen

section '.text' executable
strcspn:
        enter   16, 0
        mov     qword [rbp-8], rdi
        call    strpbrk
        test    rax, rax
        jz      @f
        sub     rax, qword [rbp-8]
        jmp     .end
@@:     mov     rdi, qword [rbp-8]
        call    strlen
.end:   leave
        ret
