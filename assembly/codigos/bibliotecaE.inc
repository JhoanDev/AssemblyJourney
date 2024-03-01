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
    
    TAM_BUFFER equ 0x0A
segment .bss
    BUFFER resb 0x01

segment .text

saidaResultado:
    mov rax, SYS_WRITE
    mov rbx, STD_OUT
    mov rcx, BUFFER
    mov rdx, TAM_BUFFER
    int SYS_CALL
    ret