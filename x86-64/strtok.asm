format ELF64 as 'o'

public  strtok
extrn   strpbrk

section '.data' writable
token:  dq 0

section '.text' executable
strtok: 
        enter   16, 0
        test    rdi, rdi
        jz      @f
        mov     qword [token], rdi
@@:     mov     rax, qword [token]
        test    rax, rax
        jz      .end
        mov     rdi, rax
        mov     qword [rbp-8], rdi
        call    strpbrk
        test    rax, rax
        jz      @f
        mov     byte [rax], 0
        inc     rax
@@:     mov     qword [token], rax
        mov     rax, qword [rbp-8]
.end:   leave
        ret
