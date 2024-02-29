## Comandos

- **`int 0x80`**: Chama o sistema operacional para executar o que está nos registradores.

### Encerrar o programa: 

```assembly    
mov eax, 0x01   ; encerrar o programa
mov ebx, 0x00   ; return 0 (pode ser qualquer valor)
int 0x80
```

### Entrada de dados:

```assembly    
mov eax, 0x03   ; Codigo de chamada para ler
mov ebx, 0x00   ; Indica uma entrada de valor na padrão do Sistema, corresponde a System.in
mov ecx, nome   ; Ponteiro para a "Variável"
mov edx, 0x1A   ; Tamanho esperado da entrada
int 0x80
```

### Saída de dados:

```assembly
mov eax, 0x04   ; Codigo de chamada para escrever
mov ebx, 0x01   ; Indica uma saída de valor na padrão do Sistema, corresponde a System.out
mov ecx, msg   ; Ponteiro para a saída desejada
mov edx, tam   ; Tamanho da saída.
int 0x80    
```