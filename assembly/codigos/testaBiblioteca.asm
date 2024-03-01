%include 'bibliotecas/bibliotecaE.inc'

section .text
    global _start

_start:
    lea rsi, [BUFFER]; loade effective address
    add rsi, 0x09
    mov byte[esi], LN

    dec esi
    mov dl, 0x13 ; -> C 0x33 -> c
    add dl, '0'
    mov [esi], dl

    dec esi
    mov dl, 0x12 ; -> B 0x32 -> b
    add dl, '0'
    mov [esi], dl

    dec esi
    mov dl, 0x11 ; -> A 0x31 -> a
    add dl, '0'
    mov [esi], dl

    call saidaResultado

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL