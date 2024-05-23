%include '../bibliotecas/arquivos.inc'

section .data
    nom_arq db "arquivo.txt"
    tam_arq equ 1384 ;exatamente o tamanho do meu arquivo

section .bss
    fd resb 4        ;file descriptor (a posicao onde esta o arquivo) 
    buffer resb 1384 ;exatamente o tamanho do meu arquivo 

section .text
    global _start:

_start:

    mov rax, OPEN_FILE
    mov rbx, nom_arq
    mov rcx, OPEN_READ
    int SYS_CALL
    ; me deu o descriptor em rax

ler: 
    mov [fd], rax ;armazenando o fd

    ;lendo 1 kb
    mov rax, READ_FILE
    mov rbx, [fd]
    mov rcx, buffer
    mov rdx, tam_arq
    int SYS_CALL

saida:
    ;printando
    mov rax, SYS_WRITE
    mov rbx, STD_OUT
    mov rcx, buffer
    mov rdx, tam_arq
    int SYS_CALL

final:
    ;fechando o arquivo
    mov rax, CLOSE_FILE
    mov rbx, [fd]
    int SYS_CALL
    ;finalizando
    mov rax, SYS_EXIT
    mov rbx, RET_EXIT
    int SYS_CALL
