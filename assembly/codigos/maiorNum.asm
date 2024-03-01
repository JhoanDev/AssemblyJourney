segment .data
    LN equ 0x0A         ; Quebra de linha (análogo ao \n em C)
    EOS equ 0x0D        ; EOS(End of String) Final da String (análogo ao \0 em C)
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
    x dd 50 
    y dd 100 
    msg1 db 'X e maior que Y',LN,EOS
    tam1 equ $- msg1
    msg2 db 'Y e maior que X',LN,EOS
    tam2 equ $- msg2

section .text

global _start

_start:
    mov eax, DWORD[x]
    mov ebx, DWORD[y]
    ; salto condicional (condicional jump)
    cmp eax, ebx ; if 
    jg maior ; como irá comparar
    mov ecx, msg2
    mov edx, tam2
    ; je == 
    jmp final
    ; jg > 
    ; jge >=
    ; jl <
    ; jle <=
    ; jne !=
    ; jmp salto incondicional
maior:
    mov ecx, msg1
    mov edx, tam1

final:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    int SYS_CALL

return:
    mov eax, SYS_EXIT
    xor ebx, ebx ; mov ebx, RET_EXIT 
    int SYS_CALL

;     AND     OR      XOR
; 7 - 0111    0111    0111
; 5 - 0101    0101    0101
;     0101    0111    0010
;      5       7       2

; xor entre valores iguais da 0