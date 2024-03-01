%include 'bibliotecas/bibliotecaE.inc'

section .data
    var dw "0"

section .text
    global _start

_start:
    lea esi, [var]

    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, esi
    mov edx, 0x03
    int SYS_CALL
    
    mov dword [var], "1"

    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, esi
    mov edx, 0x03
    int SYS_CALL

    mov dword [var], "2"

    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, esi
    mov edx, 0x03
    int SYS_CALL

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL