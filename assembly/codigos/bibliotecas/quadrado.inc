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

    estrela db '* '
    espaco db LN
    tam_estrela equ $- estrela
    tam_espaco equ $- espaco

segment .text

printa_estrela:
    mov rax, SYS_WRITE
    mov rbx, STD_OUT
    mov rcx, estrela
    mov rdx, 0x02
    int SYS_CALL
    ret

printa_espaco:
    mov rax, SYS_WRITE
    mov rbx, STD_OUT
    mov rcx, espaco
    mov rdx, tam_espaco
    int SYS_CALL
    ret

scanf:
;-------------------------------------------------------------------------------
; Lê um valor e salva num local
;-------------------------------------------------------------------------------
; Entrada: rcx ('variavel') rdx (tamanho)
;-------------------------------------------------------------------------------
    mov rax, 0x03
    mov rbx, 0x00
    int SYS_CALL
    ret