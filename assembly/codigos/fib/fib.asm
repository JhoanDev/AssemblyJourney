section .text

global fibonacci

fibonacci:
    mov rax, 0x01
    mov r8, 0x00
    mov r9, 0x01
    jmp _calculafib
    
_calculafib:
    sub rdi, 0x01
    cmp rdi, 0x00
    je _terminar
    mov rax, r9
    add rax, r8
    jmp _trocar

_trocar:
    mov r8, r9
    mov r9, rax
    jmp _calculafib

_terminar:
    ret