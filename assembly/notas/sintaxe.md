## Sintaxe assembly

`section .data` é a seção onde ficam as "variáveis"

`section .text` ainda não sei

`global _start` ainda não sei
 
`_start` como se fosse o int main do C
   
`mov` Significa mover ex: mov eax, 0x01 (movendo o valor 1 para o registrador eax)
 
`int 0x80 ` chama o sistema operacional para executar o que esta nmos registradores

    int 0x80 ;executa systema operacional

    mov eax, 0x01 ; encerrar o programa
    mov ebx, 0x00 ; return 0
    int 0x80