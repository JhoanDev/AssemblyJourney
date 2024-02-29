; para compliar digita: nasm -f elf64 hello.asm
; linkeditar: transformar um programa .o em um executavel
; ld -s -o main hello.o

section .data
    hello db 'Hello World!', 0x0A
    tam equ 0x0D ;tamanho da mensagem 
    ; tam equ $- hello (mesma coisa)
section .text

global _start

_start:
    mov eax, 0x04
    mov ebx, 0x01
    mov ecx, hello ;mensagem
    mov edx, tam ;tamanho da mensagem
    int 0x80 ;executa systema operacional

    ; mov destino, origem
    mov eax, 0x01 ; encerrar o programa
    mov ebx, 0x00 ; return 0
    int 0x80