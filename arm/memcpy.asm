format ELF as 'o'

public  memcpy

section '.text' executable
memcpy:
@@:     tst     r2, r2
        beq     @f
        sub     r2, r2, #1
        ldrb    r3, [r1, r2]
        strb    r3, [r0, r2]
        b       @b
@@:     bx      lr
