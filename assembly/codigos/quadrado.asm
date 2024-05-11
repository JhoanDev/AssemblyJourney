%include "bibliotecas/quadrado.inc"

section .data
    mensagem db "Insira o lado do quadrado: ",LN, EOS
    tam equ $- mensagem

section .bss
    num resb 0x01

section .text
    global _start

_start:
    mov byte[num], 0x10
    movzx rdi, word[num] ;controlador de linha


_inicio: 
    movzx rsi, word[num] ;controlador de coluna
    call printa_espaco
    sub rdi, 0x01
    cmp rdi, 0x00
    jl fim
    jmp _linha

_linha:
    call printa_estrela
    sub rsi, 0x01
    cmp rsi, 0x00
    je _inicio
    jmp _linha

fim:
    call printa_espaco
    mov rax, SYS_EXIT
    mov rbx, RET_EXIT
    int SYS_CALL
    