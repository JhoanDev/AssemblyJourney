## Sintaxe assembly

- **`;`**: É utilizado para realizar comentarios no codigo fonte em assembly.

- **`segment`**: É uma parte de uma seção.

- **`section .data`**: Esta é a seção onde ficam as "constantes".
  
- **`section .bss`**: Esta é a seção onde ficam as "variáveis".

- **`section .text`**: Esta é a seção que teremos o que o programa irá executar (Um marcador em particular deve ser o primeiro e definido
através do comando "global" e padronizado com o nome "_start".).

    ```assembly
    section .text 
    
    global _start
    ```

- **`global _start`**: Esta ainda não sei.

- **`_start`**: Define o ponto de entrada do programa Assembly. É análogo ao `int main()` em C.

- **`mov`**: Significa mover. Exemplo: `mov eax, 0x01` (move o valor 1 para o registrador `eax`).

    ```assembly
    mov eax, 0x01    ;Move o valor 1 para o registrador eax, usado para indicar a syscall "sys_exit"
    mov ebx, 0x00   ;Move o valor 0 para o registrador ebx, usado para indicar o status de saída "exit status"
    int 0x80    ;Chama o sistema operacional para executar a syscall "sys_exit" e encerrar o programa
    ```

- **`equ`**: Usado para salvar um valor,  É análogo ao `=` em C.

### Alocação de Memória

- **`db`**: Aloca 1 byte.
- **`dw`**: Aloca 2 bytes.
- **`dd`**: Aloca 4 bytes.
- **`dq`**: Aloca 8 bytes.
- **`ddq`**: Aloca 10 bytes (para inteiros).
- **`dt`**: Aloca 10 bytes (para decimais).

#### Exemplo de utilização:

```assembly
section .data
    hello db 'Hello World!', 0x0A
    tam equ 0x0D ;tamanho da mensagem 
    ; tam equ $- hello (mesma coisa)
```

Essas diretivas são úteis para reservar espaço na memória para diferentes tipos de dados que o programa pode precisar armazenar ou manipular durante sua execução.