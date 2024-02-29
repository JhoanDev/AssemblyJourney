## Sintaxe assembly

- **`;`**: É utilizado para realizar comentarios no codigo fonte em assembly.

- **`segment`**: É uma parte de uma seção.

- **`section .data`**: Esta é a seção onde ficam as "constantes".
- 
- **`section .bss`**: Esta é a seção onde ficam as "variáveis".

- **`section .text`**: Esta seção ainda não sei.

- **`global _start`**: Esta ainda não sei.

- **`_start`**: Define o ponto de entrada do programa Assembly. É análogo ao `int main()` em C.

- **`mov`**: Significa mover. Exemplo: `mov eax, 0x01` (move o valor 1 para o registrador `eax`).

- **`int 0x80`**: Chama o sistema operacional para executar o que está nos registradores.

    ```assembly
    mov eax, 0x01    ;Move o valor 1 para o registrador eax, usado para indicar a syscall "sys_exit"
    mov ebx, 0x00   ;Move o valor 0 para o registrador ebx, usado para indicar o status de saída "exit status"
    int 0x80    ;Chama o sistema operacional para executar a syscall "sys_exit" e encerrar o programa
    ```

- **`equ`**: Usado para salvar um valor,  É análogo ao `=` em C.
    
     ```assembly
    mov eax, 0x01    ;Move o valor 1 para o registrador eax, usado para indicar a syscall "sys_exit"
    mov ebx, 0x00   ;Move o valor 0 para o registrador ebx, usado para indicar o status de saída "exit status"
    int 0x80    ;Chama o sistema operacional para executar a syscall "sys_exit" e encerrar o programa
    ```