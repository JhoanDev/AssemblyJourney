section .text 

global calcular

calcular:
    cmp rdx, '1'
    je _soma
    cmp rdx, '2'
    je _subtracao
    cmp rdx, '3'
    je _multiplicacao
    cmp rdx, '4'
    je _divisao
    ret

_soma:
    mov rax, rdi
    add rax, rsi
    ret

_subtracao:
    mov rax, rdi
    sub rax, rsi
    ret

_multiplicacao:
    mov rax, rdi
    imul rax, rsi
    ret

_divisao: 
    xor rdx, rdx
    mov rax, rdi
    div rsi
    ret
