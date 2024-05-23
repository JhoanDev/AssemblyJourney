segment .data
    LN          equ 0x0A   ; Quebra de linha (análogo ao \n em C)
    EOS         equ 0x0D   ; EOS(End of String) Final da String (análogo ao \0 em C)
    SYS_CALL    equ 0x80   ; Envia a informação para o SO

    ; EAX ou RAX
    SYS_EXIT    equ 0x01   ; Codigo de chamada para finalizar
    SYS_READ    equ 0x03   ; Codigo de chamada para ler 
    SYS_WRITE   equ 0x04   ; Codigo de chamada para escrever

    ; EBX ou RBX
    RET_EXIT    equ 0x00   ; Retorno da chamada de finalização (pode ser qualquer valor)
    STD_IN      equ 0x00   ; Entrada padrão
    STD_OUT     equ 0x01   ; Saída padrão

    READ_FILE   equ 0x03   ; ler o arquivo
    WRITE_FILE  equ 0x04   ; escrever no arquivo
    OPEN_FILE   equ 0x05   ; abrir o arquivo
    CLOSE_FILE  equ 0x06   ; fechar o arquivo
    CREATE_FILE equ 0x08   ; criar o arquivo

    OPEN_READ   equ 0x00   ; abrir o arquivo para leitura
    OPEN_WRITE  equ 0x01   ; abrir o arquivo para escrita
    OPEN_RW     equ 0x02   ; abrir o arquivo para escrita/leitura
    OPEN_CREATE equ 0x40   ; se o arquivo nao existe ele cria
    OPEN_APPEND equ 0x400  ; arquivo para adicionar informação 
