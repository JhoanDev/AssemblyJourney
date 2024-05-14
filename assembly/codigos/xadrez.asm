%include "bibliotecas/xadrez.inc"

section .text
    global _start

_start:
    mov r8, 0x08 ; 8 linhas
    mov r9, 0x08 ; 16 colunas, mas so preciso da informação da metade
    mov r10, 0x00 ; contador de linhas
    mov r11, 0x02 ; divisor
    
_laco:
    call printa_quebra_de_linha
    add r10, 0x01 ; adicionando 1 no contador de linhas
    cmp r10,r8
    jg _fim
    mov r12, 0x00 ; contador de colunas
    xor rdx, rdx
    mov rax, r10
    mov rbx, r11
    div rbx
    cmp rdx, 0x00
    je _linha_impar
    jmp _linha_par


_linha_par:
    add r12, 0x01 ; adicionando 1 no contador de colunas
    call printa_estrela
    call printa_espaco
    cmp r12, r9
    jl _linha_par
    jmp _laco

_linha_impar:
    add r12, 0x01 ; adicionando 1 no contador de colunas
    call printa_espaco
    call printa_estrela
    cmp r12, r9
    jl _linha_impar
    jmp _laco

_fim:
    call printa_quebra_de_linha
    mov rax, SYS_EXIT
    mov rbx, RET_EXIT
    int SYS_CALL