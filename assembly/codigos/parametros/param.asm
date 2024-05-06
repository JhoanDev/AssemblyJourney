section .text

global passar_param

passar_param:
    mov eax, edi
    add eax, esi
    add eax, edx
    ret