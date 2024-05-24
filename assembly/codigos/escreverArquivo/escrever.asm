%include '../bibliotecas/arquivos.inc'

section .data
    msg db "Hello World!", LN , "Cristiano Ronaldo é o melhor do mundo.", LN
    tamanhoMsg equ $- msg
    arquivo db "hello.txt"
    tamArquivo equ $- arquivo

section .bss
    fd resb 4        ;file descriptor (a posicao onde esta o arquivo) 

section .text
    global _start

_start:
    mov rax, CREATE_FILE
    mov rbx, arquivo
        ;[6,6,4] = [usuario, grupo, outros]
    mov rcx, 0o664     ; 1=x 2=w 3=wx 4=r 5=rx 6=rw 7=rwx (está em octal) [x = executavel, w = escrita, r = leitura]
    mov rdx, tamArquivo
    int SYS_CALL

escrita:
    mov [fd], rax

    mov rax, WRITE_FILE
    mov rbx, [fd]
    mov rcx, msg
    mov rdx, tamanhoMsg
    int SYS_CALL

fechar:
    mov rax, CLOSE_FILE
    mov rbx, [fd]
    int SYS_CALL

fim:
    mov rax, SYS_EXIT
    mov rbx, RET_EXIT
    int SYS_CALL