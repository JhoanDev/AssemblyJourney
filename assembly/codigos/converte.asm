%include 'bibliotecas/bibliotecaE.inc'

section .data
    v1 dw '2', LN, EOS

section .text
    global _start

_start:
    call converte_valor
    call mostrar_valor

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL

converte_valor:
    lea esi,[v1]
    mov ecx, 0x01
    call string_to_int
    add eax, 0x02
    ret

mostrar_valor:
    call int_to_string
    call saidaResultado
    ret