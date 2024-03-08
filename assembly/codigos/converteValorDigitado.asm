section .data
    msgnum1 db 'Insira o primeiro numero: ',0x0A, 0x0D
    msgnum2 db 'Insira o segundo numero: ',0x0A, 0x0D
    TAM_BUFFER equ 0x0A

section .bss
    num1 resb 0x01
    num2 resb 0x01
    BUFFER resb 0x01

section .text
    global _start

_start:
    ; lendo o valor 1
    mov rcx, num1
    mov rdx, 0x01
    call scanf
    ; transformando em inteiro
    lea rsi, num1
    mov rcx, 0x01
    call parse_int
    ; transformando em string
    call parse_string
    ; Printando o valor
    mov rax, 0x04
    mov rbx, 0x01
    mov rcx, BUFFER
    mov rdx, TAM_BUFFER
    int 0x80
    jmp return_0

; Entrada: eax (com um inteiro)
; Saida: BUFFER (valor em ecx) TAM_BUFFER (edx)
parse_string:
    lea rsi, [BUFFER]
    add rsi, 0x09
    mov byte[rsi], 0x0A
    mov rbx, 0x0A 
    proximo_char:
        xor rdx, rdx
        div rbx
        add dl, '0'
        dec rsi
        mov [rsi], dl
        test rax, rax
        jnz proximo_char
        ret

; Entrada: esi (valor conv) ecx (tam)
; Saida: eax
parse_int:
    xor rbx, rbx
    proximo_numero:
        movzx rax, byte[rsi]
        inc rsi
        sub al, '0'
        imul rbx, 0x0A 
        add rbx, rax 
        loop proximo_numero
        mov rax, rbx
        ret

; Entrada: rcx ('variavel') rdx (tamanho)
scanf:
    mov rax, 0x03
    mov rbx, 0x00
    int 0x80
    ret

; Entrada: rcx (A string)
printf: 
    mov rax, 0x04
    mov rbx, 0x01
    call tam_str
    int 0x80
    ret

; Entrada: rcx (A string)
; Saida: rdx (O tamanho dela)
tam_str:
    xor rdx, rdx
    mov rsi, rcx
    proximochar:
        cmp byte[rsi], 0x0D
        je finalizar
        inc rsi
        add rdx, 0x01
        jmp proximochar
    finalizar:
        xor rsi, rsi
        ret


return_0:
    mov rax, 0x01
    xor rbx, rbx
    int 0x80