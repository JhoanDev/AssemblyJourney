## Comandos

- `int 0x80`: Chamada de sistema que interrompe o processador e transfere o controle para o kernel do sistema operacional.

### Saída de dados:

```assembly
mov eax, 0x04   (Prepara a syscall para sys_write)
mov ebx, 0x01   (Define o file descriptor para stdout, saída padrão)
mov ecx,    (Ponteiro para a saída desejada)
mov edx,    (Tamanho da saída.)
int 0x80    (Chama o kernel para escrever a saída na saída padrão)
