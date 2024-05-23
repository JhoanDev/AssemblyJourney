segment .data
    LN equ 0x0A         ; Quebra de linha (análogo ao \n em C)
    SYS_EXIT equ 60     ; Código de chamada para finalizar
    SYS_WRITE equ 1     ; Código de chamada para escrever
    RET_EXIT equ 0x00   ; Retorno da chamada de finalização (pode ser qualquer valor)
    STD_IN equ 0x00     ; Entrada padrão
    STD_OUT equ 0x01    ; Saída padrão

    espaco db ' ', 0
    quebra_de_linha db LN, 0
    BUFFER db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  ; espaço para 10 caracteres

segment .text

printa_espaco:
    mov rax, SYS_WRITE
    mov rdi, STD_OUT
    mov rsi, espaco
    mov rdx, 1
    syscall
    ret

printa_quebra_de_linha:
    mov rax, SYS_WRITE
    mov rdi, STD_OUT
    mov rsi, quebra_de_linha
    mov rdx, 1
    syscall
    ret

parse_string:
    lea rsi, [BUFFER + 9] ; Aponta para o final do buffer
    mov rbx, 10           ; Divisor (base 10)
proximo_char:
    xor rdx, rdx          ; Limpa rdx antes da divisão
    div rbx               ; Divide rax por 10, resultado em rax, resto em rdx
    add dl, '0'           ; Converte o dígito em caractere ASCII
    dec rsi               ; Move o ponteiro para a próxima posição no buffer
    mov [rsi], dl         ; Armazena o caractere no buffer
    test rax, rax         ; Verifica se rax é zero
    jnz proximo_char      ; Continua se rax não for zero
    mov rcx, rsi          ; Coloca o endereço da string resultante em rcx
    ret

printf: 
    mov rax, SYS_WRITE    ; syscall número para write
    mov rdi, STD_OUT      ; descritor de arquivo para stdout
    mov rdx, BUFFER + 10  
    calcula_tamanho:
        sub rdx, rcx          ; Subtrai o endereço inicial da string do final para obter o tamanho
        mov rsi, rcx          ; Ponteiro para a string a ser impressa
        syscall               ; Executa a chamada do sistema
        ret

exit:
    call printa_quebra_de_linha
    mov rax, SYS_EXIT     ; syscall número para exit
    xor rdi, rdi          ; código de saída 0
    syscall               ; Executa a chamada do sistema
