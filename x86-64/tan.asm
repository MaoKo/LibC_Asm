format ELF64 as 'o'

public  f_tan
public  f_tanf
public  f_tanl

section '.text' executable
f_tan:
        enter   16, 0
        movapd  dqword [rsp], xmm0
        finit
        fld     qword [rsp]
        fptan
        fstp    st0
        fstp    qword [rsp]
        movapd  xmm0, dqword [rsp]
        leave
        ret

f_tanf:
        enter   16, 0
        movaps  dqword [rsp], xmm0
        finit
        fld     dword [rsp]
        fptan
        fstp    st0
        fstp    dword [rsp]
        movaps  xmm0, dqword [rsp]
        leave
        ret

f_tanl:
        finit
        fld     tword [rsp+8]
        fptan
        fstp    st0
        ret
