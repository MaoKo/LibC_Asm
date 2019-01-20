format ELF as 'o'

public  memchr

section '.text' executable
memchr:
        eor     r3, r3, r3
@@:     tst     r2, r2
        beq     @f
        ldrb    r3, [r0, #0]
        cmp     r3, r1
        moveq   r3, r0
        beq     @f
        eor     r3, r3, r3
        add     r0, r0, #1
        sub     r2, r2, #1
        b       @b
@@:     mov     r0, r3
        bx      lr


