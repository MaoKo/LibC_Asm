format ELF as 'o'

public  memset

section '.text' executable
memset:
@@:     tst     r2, r2
        beq     @f
        sub     r2, r2, #1
        strb    r1, [r0, r2]
        b       @b
@@:     bx      lr

