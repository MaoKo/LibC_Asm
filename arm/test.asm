format ELF executable
entry _start

segment readable executable
strlen:
        mov     r1, r0
@@:     ldrb    r2, [r0, #0]
        tst     r2, r2
        addne   r0, r0, #1
        bne     @b
        sub     r0, r0, r1
        bx      lr

memcpy:
@@:     tst     r2, r2
        beq     @f
        sub     r2, r2, #1
        ldrb    r3, [r1, r2]
        strb    r3, [r0, r2]
        b       @b
@@:     bx      lr


memmove:
        push    {r0,lr}
        cmp     r1, r0
        beq     .end
        blt     .mmc
        sub     r0, r0, #1
        sub     r1, r1, #1
@@:     tst     r2, r2
        beq     .end
        sub     r2, r2, #1
        ldrb    r3, [r1, #1]!
        strb    r3, [r0, #1]!
        b       @b
.mmc:   bl      memcpy
.end:   pop     {r0,pc}

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

memccpy:
        push    {r0-r4,lr}
        add     sp, sp, #4
        ldmfd   sp, {r0-r2}
        bl      memchr
        mov     r4, r0
        sub     sp, sp, #4
        ldmfd   sp, {r0-r3}
        mov     r2, r3
        tst     r4, r4
        beq     @f
        add     r4, r4, #1
        sub     r2, r4, r1
@@:     bl      memcpy
        add     sp, sp, #16
        mov     r0, r4
        pop     {r4,pc}

memrchr:
        eor     r3, r3, r3
@@:     tst     r2, r2
        beq     @f
        sub     r2, r2, #1
        ldrb    r3, [r0, r2]
        cmp     r3, r1
        addeq   r3, r0, r2
        beq     @f
        eor     r3, r3, r3
        b       @b
@@:     mov     r0, r3
        bx      lr

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

write_str:
        tst     r0, r0
        moveq   r0, null
        push    {r0,lr}
        bl      strlen
        mov     r2, r0
        pop     {r1}
        mov     r0, #1
        mov     r7, #4
        svc     #0
        mov     r0, #$0A
        push    {r0}
        mov     r0, #1
        mov     r1, sp
        mov     r2, #1
        mov     r7, #4
        svc     #0
        pop     {r0,pc}

strcpy:
        push    {r0,r1,lr}
        mov     r0, r1
        bl      strlen
        add     r2, r0, #1
        pop     {r0,r1}
        bl      memcpy
        pop     {pc}

memset:
@@:     tst     r2, r2
        beq     @f
        sub     r2, r2, #1
        strb    r1, [r0, r2]
        b       @b
@@:     bx      lr

bzero:
        push    {lr}
        mov     r2, r1
        eor     r1, r1, r1
        bl      memset
        pop     {pc}

strncpy:
        push    {r0-r2,r4,lr}
        mov     r0, r1
        bl      strlen
        mov     r3, r0
        ldr     r2, [sp, #8]
        cmp     r3, r2
        sublt   r3, r2, r3
        movlt   r2, r0
        eorge   r3, r3, r3
        str     r2, [sp, #8]
        ldmfd   sp, {r0,r1}
        push    {r3}
        bl      memcpy
        pop     {r3}
        pop     {r0-r2}
        mov     r4, r0
        tst     r3, r3
        beq     @f
        add     r0, r0, r2
        mov     r1, r3
        bl      bzero
@@:     mov     r0, r4
        pop     {r4,pc}

strchr:
        push    {r0,r1,lr}
        bl      strlen
        add     r2, r0, #1
        pop     {r0,r1}
        bl      memchr
        pop     {pc}

strrchr:
        push    {r0,r1,lr}
        bl      strlen
        add     r2, r0, #1
        pop     {r0,r1}
        bl      memrchr
        pop     {pc}

strcat:
        push    {r0,lr}
        push    {r1}
        eor     r1, r1, r1
        bl      strchr
        pop     {r1}
        bl      strcpy
        pop     {r0,pc}

strncat:
        push    {r0-r2,lr}
        mov     r0, r1
        bl      strlen
        ldr     r2, [sp, #8]
        cmp     r2, r0
        movgt   r2, r0
        strgt   r2, [sp, #8]
        ldr     r0, [sp, #0]
        eor     r1, r1, r1
        bl      strchr
        ldr     r1, [sp, #4]
        ldr     r2, [sp, #8]
        eor     r3, r3, r3
        strb    r3, [r0, r2]
        bl      strncpy
        pop     {r0-r2,pc}

strstr:        
        pop     {pc}

strnstr:
        pop     {pc}

_start:
        mov     r0, str0
        mov     r1, str1
        mov     r2, #0
        bl      strncat
        bl      write_str

        mov     r0, str1
        mov     r1, str2
        mov     r2, #'Z'
        mov     r3, #3

        bl      memccpy
        bl      write_str

        mov     r0, str1
        bl      write_str

        mov     r0, str2
        bl      write_str

        b       @f

        cmp     r0, #0
        bne     @f
        mov     r0, hello
        mov     r1, #'o'
        mov     r2, #len
        bl      memrchr
        tst     r0, r0
        beq     @f
        push    {r0}
        bl      strlen
        pop     {r1}
        mov     r2, r0
        mov     r0, #1
        mov     r7, #4
        svc     #0
@@:     eor     r0, r0, r0
        mov     r7, #1
        svc     #0

segment readable writable
str0    db "XXXYY", 0,0,0,0,0
str1    db "ABC", 0
str2    db "DEF", 0

null    db "(null)", 0

hello   db "Hello, World???", 10, 0
len     = $ - hello

