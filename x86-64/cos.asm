format ELF64 as 'o'

public  cos
public  cosf
public  cosl

section '.text' executable
cos:
        enter   16, 0
        movapd  dqword [rsp], xmm0
        finit
        fld     qword [rsp]
        fcos
        fstp    qword [rsp]
        movapd  xmm0, dqword [rsp]
        leave
        ret

cosf:
        enter   16, 0
        movaps  dqword [rsp], xmm0
        finit
        fld     dword [rsp]
        fcos
        fstp    dword [rsp]
        movaps  xmm0, dqword [rsp]
        leave
        ret

cosl:
        finit
        fld     tword [rsp+8]
        fcos
        ret
