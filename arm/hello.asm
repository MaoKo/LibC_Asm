format ELF as 'o'

public   _start
extrn   strlen

section '.text' executable
_start:
        ldr     r0, [pc, #4]
        add     r4, pc, #4
        bx      r4
        dd      hello
        bl      strlen
        sub     r4, r4, #4
        mov     r2, 5
        mov     r1, r4
        mov     r0, #1
        mov     r7, #4
        svc     #0
        eor     r0, r0, r0
        mov     r7, #1
        svc     #0

section '.data' writable
hello   db "HELLO, WORLD", $0A, 0
