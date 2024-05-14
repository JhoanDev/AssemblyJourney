section .text
    global primo

primo:
    mov r8, 0x02
    

_laco:
    cmp r8, rdi
    jl _testadivisao
    jmp _primo

_testadivisao:
    xor rdx, rdx
    mov rax, rdi
    mov rbx, r8
    div rbx
    add r8, 0x01
    cmp rdx, 0x00
    je _naoprimo
    jmp _laco


_primo: 
    mov rax, 0x01
    ret

_naoprimo:
    mov rax, 0x00
    ret