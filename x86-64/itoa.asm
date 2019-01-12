format ELF64 as 'o'

public  __stack_itoa
public  itoa

MIN_BASE = 02
MAX_BASE = 36

section '.text' executable
__stack_itoa:
        pop     rsi
        xor     rcx, rcx
        cmp     rdi, MIN_BASE
        jb      .end
        cmp     rdi, MAX_BASE
        ja      .end
        mov     rax, rdi
        mov     rcx, rsi
        mov     r8,  rdx
        mov     r9,  rsp
.loop:  xor     rdx, rdx
        div     rcx
        cmp     r8, 10
        ja      @f     
        add     rdx, $30
        jmp     .str
@@:     sub     rdx, 10
        add     rdx, $41
        test    r8, r8
        jz      .str
        xor     rdx, $20
.str:   push    rdx
        test    rax, rax
        jnz     .loop
        sub     r9, rsp
        mov     rcx, r9
        push    rsi
.end:   ret

itoa:
        ret
