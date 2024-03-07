%include 'bibliotecas/bibliotecaE.inc'

section .data
    msg db 'Entre com um valor de até 3 digitos: ',LN,EOS
    tammsg equ $- msg
    par db LN,'Numero par!',LN,EOS
    tampar equ $- par
    impar db LN,'Numero impar!',LN,EOS
    tamimpar equ $- impar

section .bss
    num resb 1

section .text
    global _start

_start
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg
    mov edx, tammsg
    int SYS_CALL

entrada_valor:
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, num
    mov edx, 0x04
    int SYS_CALL

    lea esi, [num]
    mov ecx, 0x03
    call string_to_int

verificar: 
    xor edx, edx
    mov ebx, 0x02
    div ebx
    cmp edx, 0x00
    jz mostra_par

mostra_impar:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, impar
    mov edx, tamimpar
    int SYS_CALL
    jmp saida

mostra_par:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, par
    mov edx, tampar
    int SYS_CALL
    jmp saida

saida:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL