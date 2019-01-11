format ELF64 as 'o'

public  sin
public  sinf
public  sinl

section '.text' executable
sin:
        enter   16, 0
        movapd  dqword [rsp], xmm0
        finit
        fld     qword [rsp]
        fsin
        fstp    qword [rsp]
        movapd  xmm0, dqword [rsp]
        leave
        ret

sinf:
        enter   16, 0
        movaps  dqword [rsp], xmm0
        finit
        fld     dword [rsp]
        fsin
        fstp    dword [rsp]
        movaps  xmm0, dqword [rsp]
        leave
        ret

sinl:
        finit
        fld     tword [rsp+8]
        fsin
        ret

