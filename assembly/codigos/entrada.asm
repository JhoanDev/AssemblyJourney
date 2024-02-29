segment .data
    LN equ 0x0A     ; Quebra de linha (análogo ao \n em C)
    EOS equ 0x0D   ; EOS(End of String) Final da String (análogo ao \0 em C)
    SYS_CALL equ 0x80   ; Envia a informação para o SO
    ; EAX ou RAX
    SYS_EXIT equ 0x01   ; Codigo de chamada para finalizar
    SYS_READ equ 0x03   ; Codigo de chamada para ler 
    SYS_WRITE equ 0x04  ; Codigo de chamada para escrever
    ; EBX ou RBX
    RET_EXIT equ 0x00   ; Retorno da chamada de finalização (pode ser qualquer valor)
    STD_IN equ 0x00     ; Entrada padrão
    STD_OUT equ 0x01    ; Saída padrão

section .data
    msg db "Insira seu nome: ",LN,EOS
    tam equ $- msg

section .bss
    nome resb 1

section .text

global _start

_start:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg
    mov edx, tam
    int SYS_CALL

    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, nome
    mov edx, 0x1A
    int SYS_CALL

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL

