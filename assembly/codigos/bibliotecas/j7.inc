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

printf: 
;-------------------------------------------------------------------------------
; Printa uma string no terminal
;-------------------------------------------------------------------------------
; Entrada: rcx (A string)
;-------------------------------------------------------------------------------
    mov rax, SYS_WRITE
    mov rbx, STD_OUT
    call tam_str
    int SYS_CALL
    ret

tam_str:
;-------------------------------------------------------------------------------
; Calcula o tamanho de uma string
;-------------------------------------------------------------------------------
; Entrada: rcx (A string)
; Saida: rdx (O tamanho dela)
;-------------------------------------------------------------------------------
    xor rdx, rdx
    mov rsi, rcx
    proximochar:
        cmp byte[rsi], EOS
        je finalizar
        inc rsi
        add rdx, 0x01
        jmp proximochar
    finalizar:
        xor rsi, rsi
        ret

return_0:
;-------------------------------------------------------------------------------
; Finaliza o programa
;-------------------------------------------------------------------------------
    mov rax, SYS_EXIT
    xor rbx, RET_EXIT
    int SYS_CALL

parse_string:
;--------------------------------------
; Inteiro para string
;--------------------------------------
; Entrada: eax (vom um inteiro)
; Saida: BUFFER (valor em ecx) TAM_BUFFER (edx)
;--------------------------------------
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

parse_int:
;--------------------------------------
; String para inteiro
;--------------------------------------
; Entrada: esi (valor conv) ecx (tam)
; Saida: eax
;--------------------------------------
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