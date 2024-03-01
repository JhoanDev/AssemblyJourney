section .data
    saoiguais db 'Sao iguais', 0x0A
    tam1 equ $- saoiguais
    saodiferentes db 'Sao diferentes', 0x0A
    tam2 equ $- saodiferentes
    msg1 db 'Insira o primeiro valor', 0x0A
    tam3 equ $- msg1
    msg2 db 'Insira o segundo valor', 0x0A
    tam4 equ $- msg2

section .bss
    num resb 1
    num2 resb 1

section .text
    global _start

_start:
    mov rax, 0x04
    mov rbx, 0x01
    mov rcx, msg1
    mov rdx, tam3
    int 0x80

    mov rax, 0x03
    mov rbx, 0x00
    mov rcx, num
    mov rdx, 0x08
    int 0x80

    mov rax, 0x04
    mov rbx, 0x01
    mov rcx, msg2
    mov rdx, tam4
    int 0x80

    mov rax, 0x03
    mov rbx, 0x00
    mov rcx, num2
    mov rdx, 0x08
    int 0x80

    movzx rax, BYTE[num]
    movzx rbx, BYTE[num2]
    cmp rax, rbx
    je iguais
    jne diferentes

iguais:
    mov rax, 0x04
    mov rbx, 0x01
    mov rcx, saoiguais
    mov rdx, tam1
    int 0x80

    mov rax, 0x01
    xor rbx, rbx
    int 0x80 

diferentes:
    mov rax, 0x04
    mov rbx, 0x01
    mov rcx, saodiferentes
    mov rdx, tam2
    int 0x80

    mov rax, 0x01
    xor rbx, rbx
    int 0x80 