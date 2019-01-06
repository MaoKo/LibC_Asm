format ELF64 as 'o'

public  strpbrk
extrn   strchr

section '.text' executable
strpbrk:
        enter   32, 0
        mov     qword [rbp-8],  rdi
        mov     qword [rbp-16], rsi
        mov     qword [rbp-32], rbx
        xor     rbx, rbx
@@:     mov     rdi, qword [rbp-8]
        mov     al, byte [rdi+rbx]
        mov     rdi, qword [rbp-16]
        movzx   rsi, al
        call    strchr
        test    rax, rax
        jnz     @f
        inc     rbx
        jmp     @b
@@:     add     rbx, qword [rbp-8]
        xor     rcx, rcx
        mov     al, byte [rbx]
        test    al, al
        mov     rax, rbx
        cmovz   rax, rcx        
        pop     rbx
        leave
        ret
