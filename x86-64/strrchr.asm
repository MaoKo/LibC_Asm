format ELF64 as 'o'

public  strrchr
extrn   strlen

section '.text' executable
strrchr:
        enter   16, 0
        mov     qword [rbp-8],  rdi
        mov     qword [rbp-16], rsi
        call    strlen
        mov     rcx, rax
        mov     rdi, rax
        add     rdi, qword [rbp-8]
        mov     rax, qword [rbp-16]
        std     
        repnz
        scasb
        lea     rax, [rdi+1]
        cmovnz  rax, rcx
        leave
        ret
