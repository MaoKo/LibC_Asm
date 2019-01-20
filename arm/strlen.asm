format ELF as 'o'

public  strlen

section '.text' executable
strlen:
        mov     r1, r0
@@:     ldrb    r2, [r0, #0]
        tst     r2, r2
        addne   r0, r0, #1
        bne     @b
        sub     r0, r0, r1
        bx      lr
