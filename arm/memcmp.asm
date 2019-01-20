format ELF as 'o'

public  memcmp

section '.text' executable
memcmp:
        push    {r4,lr}
@@:     tst     r2, r2
        eoreq   r0, r0, r0
        beq     @f
        ldrb    r3, [r0, #0]
        ldrb    r4, [r1, #0]
        cmp     r3, r4
        subne   r0, r3, r4
        bne     @f
        add     r0, r0, #1
        add     r1, r1, #1
        sub     r2, r2, #1
        b       @b
@@:     pop     {r4,pc}

