%include "bibliotecas/piramide.inc"

section .bss
    num resb 0x01

section .text
    global _start

_start:
    mov byte[num], 0x04
    movzx r8, word[num] ;controlador de linha
    movzx r11, word[num]

_linha:
    mov r9, r8 ;controlador de espacos
    mov r10, r11 ;controlador de estrelas primeiro lado
    sub r10, r8
    add r10, 0x01
    mov r12, r10 ; estrelas segundo lado
    sub r12, 0x01
    sub r8, 0x01
    cmp r8, 0x00
    jl _fim
    call _espacos
    call _estrelas
    mov r10, r12
    call _estrelas
    call printa_quebra_de_linha
    jmp _linha

_estrelas:
    cmp r10, 0x00
    je _ret
    sub r10, 0x01
    call printa_estrela
    cmp r10, 0x00
    jg _estrelas
    ret

_espacos:
    sub r9, 0x01
    cmp r9, 0x00
    je _ret
    call printa_espaco
    cmp r9, 0x00
    jg _espacos
    ret

_fim:
    mov rax, SYS_EXIT
    mov rbx, RET_EXIT
    int SYS_CALL

_ret:
    ret