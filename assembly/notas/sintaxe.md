## Sintaxe assembly

- **`section .data`**: Esta é a seção onde ficam as "variáveis".

- **`section .text`**: Esta seção ainda não sei.

- **`global _start`**: Esta ainda não sei.

- **`_start`**: Define o ponto de entrada do programa Assembly. É análogo ao `int main()` em C.

- **`mov`**: Significa mover. Exemplo: `mov eax, 0x01` (move o valor 1 para o registrador `eax`).

- **`int 0x80`**: Chama o sistema operacional para executar o que está nos registradores.

    ```assembly
<<<<<<< HEAD
    mov eax, 0x01    ;(Move o valor 1 para o registrador eax, usado para indicar a syscall "sys_exit")
    mov ebx, 0x00   ;(Move o valor 0 para o registrador ebx, usado para indicar o status de saída "exit status")
    int 0x80    ;(Chama o sistema operacional para executar a syscall "sys_exit" e encerrar o programa)
=======
    mov eax, 0x01    ;Move o valor 1 para o registrador eax, usado para indicar a syscall "sys_exit"
    mov ebx, 0x00   ;Move o valor 0 para o registrador ebx, usado para indicar o status de saída "exit status"
    int 0x80    ;Chama o sistema operacional para executar a syscall "sys_exit" e encerrar o programa
>>>>>>> 3553f9f (refact: comentarios)
    ```

