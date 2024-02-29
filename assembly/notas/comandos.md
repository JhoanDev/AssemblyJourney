## Comandos

`int 0x80` chama o S.O

Saida de dados:
    mov eax, 0x04
    mov ebx, 0x01
    mov ecx, (ponteiro para a saida que você deseja)
    mov edx, (tamanho da saida)