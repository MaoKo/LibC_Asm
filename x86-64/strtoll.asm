format ELF64 as 'o'

public  strtoll
extrn   isspace

MIN_BASE = 02
MAX_BASE = 36

LLONG_MAX = 9223372036854775807

section '.text' executable
isrange:
        mov     rax, -1
        xor     r8, r8
        test    rdi, rdi
        jz      .end
        cmp     rdi, $30
        jb      .end
        mov     rcx, $39
        cmp     rsi, 10
        ja      @f
        mov     rcx, $30
        add     rcx, rsi
        inc     r8
@@:     cmp     rdi, rcx
        jae     @f
        mov     rcx, $30
        jmp     .gdg
@@:     test    r8, 1
        jnz     .end
        sub     rsi, (10+1)
        xor     rcx, rcx
        mov     r8, $41
        mov     r9, $61
        cmp     rdi, r8
        cmovae  rcx, r8
        cmp     rdi, r9
        cmovae  rcx, r9
        test    rcx, rcx
        jz      .end
        add     rcx, rsi
        cmp     rdi, rcx
        ja      .end
        sub     rcx, rsi
        add     rdi, 10
.gdg:   mov     rax, rdi
        sub     rax, rcx
.end:   ret

strtoll:
        enter   48, 0
        mov     dword [rbp-20], 0
        mov     qword [rsp], 0
        test    rdx, rdx
        jnz     @f
        mov     dword [rbp-20], 1
        jmp     .beg
@@:     cmp     rdx, MIN_BASE
        jl      .end
        cmp     rdx, MAX_BASE
        jg      .end
.beg:   mov     qword [rbp-8],  rdi
        mov     qword [rbp-16], rsi
        mov     dword [rbp-24], edx
        mov     qword [rbp-32], 0
        mov     qword [rbp-40], rdi
@@:     mov     rdi, qword [rbp-8]
        mov     al, byte [rdi]
        movzx   rdi, al
        call    isspace
        test    rax, rax
        jz      @f
        inc     qword [rbp-8]
        jmp     @b
@@:     mov     rdi, qword [rbp-8]
        mov     al, byte [rdi]
        cmp     al, $2B
        jz      .sign
        cmp     al, $2D
        jz      .sign
        jmp     @f
.sign:  inc     qword [rbp-8]
        xor     al, $2D
        setz    al
        movzx   eax, al
        mov     dword [rbp-28], eax
@@:     test    dword [rbp-20], 1
        jz      .rdc
        mov     rdi, qword [rbp-8]
        mov     dword [rbp-24], 10
        cmp     byte [rdi], $30
        jnz     .rdc
        inc     rdi
        cmp     byte [rdi], $58
        jz      .hex
        cmp     byte [rdi], $78
        jz      .hex
        mov     dword [rbp-24], 8
        jmp     @f
.hex:   mov     dword [rbp-24], $10
        inc     rdi
@@:     mov     qword [rbp-8], rdi
.rdc:   mov     rdi, qword [rbp-8]
        mov     al, byte [rdi]
        movzx   rdi, al
        xor     rsi, rsi
        mov     esi, dword [rbp-24]
        call    isrange
        cmp     rax, -1
        jz      @f
        cmp     qword [rsp], -1
        jz      .end
        xchg    rax, qword [rsp]
        xor     rcx, rcx
        mov     ecx, dword [rbp-24]
        mul     rcx
        mov     rcx, -1
        cmovo   rax, rcx
        jo      .srx
        add     rax, qword [rsp]
        mov     rdx, LLONG_MAX
        cmp     rax, rdx
        cmova   rax, rcx
.srx:   mov     qword [rsp], rax
.adv:   mov     dword [rbp-32], 1
        inc     qword [rbp-8]
        jmp     .rdc
@@:     mov     rsi, qword [rbp-16]
        test    rsi, rsi
        jz      .end
        test    dword [rbp-32], 1
        jnz     @f
        mov     rdi, qword [rbp-40]
        jmp     .setp
@@:     mov     rdi, qword [rbp-8]
.setp:  mov     qword [rsi], rdi
.end:   xor     rcx, rcx
        mov     rax, qword [rsp]
        cmp     rax, -1
        setz    cl
        jnz     @f
        mov     rax, LLONG_MAX
@@:     test    dword [rbp-28], 1
        jz      @f
        test    cl, cl
        jnz     .not
        neg     rax
        jmp     @f
.not:   not     rax
@@:     leave
        ret

