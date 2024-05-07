section .text

global maior_valor
global switchc

maior_valor:
    cmp rdi, rsi
    jg _voltardi
    jmp _voltarsi

_voltardi:
    mov rax, rdi
    ret

_voltarsi:
    mov rax, rsi
    ret


switchc:
    cmp rdi, 0x01
    je _voltar5
    cmp rdi, 0x02
    je _voltar6
    cmp rdi, 0x03
    je _voltar7
    mov rax, 0x00
    ret

_voltar5:
    mov rax, 0x05
    ret

_voltar6:
    mov rax, 0x06
    ret

_voltar7:
    mov rax, 0x07
    ret