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

;--------------------------------------
; String para inteiro
;--------------------------------------
; Entrada: esi (valor conv) ecx (tam)
; Saida: eax
;--------------------------------------

string_to_int:
    xor ebx, ebx ;zerando ebx
.proximo_digitosi:
    movzx eax, byte[esi] ; estou movendo apenas um byte para meu registrador eax e preenchendo os outros 24 bits com zero
    inc esi ; incrementando esi, é como se tivesse um vetor na posicao [0] ai com o inc eu aponto apra ele na posicao [1]
    sub al, '0' ; subtraindo
    imul ebx, 0x0A ; Multiplica o valor contido no registrador ebx por 10.
    add ebx, eax ; ebx = ebx + eax
    loop .proximo_digitosi ; while (--ecx) enquanto nao for 0 ele continua
    mov eax, ebx
    ret

;--------------------------------------
; Inteiro para string
;--------------------------------------
; Entrada: eax (vom um inteiro)
; Saida: BUFFER (valor em ecx) TAM_BUFFER (edx)
;--------------------------------------

int_to_string:
    lea esi, [BUFFER] ;fazendo eles dividerem o mesmo espaço de memoria
    add esi, 0x09
    mov byte[esi], 0x0A
    mov ebx, 0x0A
.proximo_digitois:
    xor edx,edx
    div ebx
    add dl, '0' ; adcionando
    dec esi
    mov [esi], dl
    test eax,eax
    jnz .proximo_digitois
    ret