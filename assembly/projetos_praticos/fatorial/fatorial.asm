section .data

section .text
    global fat

fat:
    mov r9, 0x01
    mov rax, 0x01
    cmp rdi, 0x01
    jle _ret1

_calculafat:
    add r9, 0x01
    imul rax, r9
    cmp r9, rdi
    jl _calculafat
    ret

_ret1:
    mov rax, 0x01
    ret