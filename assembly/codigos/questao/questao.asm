section .text

global par_ou_impar

par_ou_impar:
    mov ebx, edi
    jmp _testar
    ret

_testar:
    cmp ebx, 0
    je _par
    jl _impar
    sub ebx, 2
    jmp _testar

_par:
    mov eax, 1
    ret

_impar:
    mov eax, 0
    ret