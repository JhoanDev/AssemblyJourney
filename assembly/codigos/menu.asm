%include 'bibliotecas/menu.inc'

section .data
    title db '+-------------+',LN,'| Calculadora |',LN,'+-------------+',LN,EOS
    val1 db LN,'Valor 1: ',EOS
    val2 db LN,'Valor 2: ',EOS
    opc1 db LN,'[1] Somar',EOS
    opc2 db LN,'[2] Subtrair',EOS
    opc3 db LN,'[3] Multiplicar',EOS
    opc4 db LN,'[4] Dividir',EOS
    msg_opc db LN,'Digite sua opcao: ',EOS
    msg_err db LN,'Valor invalido!!',EOS
    p1 db LN,'Processo de adicionar',EOS
    p2 db LN,'Processo de subtrair',EOS
    p3 db LN,'Processo de multiplicar',EOS
    p4 db LN,'Processo de dividir',EOS
    msg_end db LN,'Obrigado por utilizar meu programa!',LN,EOS

section .bss 
    opc resb 1
    num1 resb 1
    num2 resb 1

section .text
    global _start

_start:
    mov ecx, title
    call mst_saida

    mov ecx, val1
    call mst_saida
    mov eax, SYS_READ
    mov ebx, STD_OUT
    mov ecx, num1
    mov edx, 0x5
    int SYS_CALL

    mov ecx, val2
    call mst_saida
    mov eax, SYS_READ
    mov ebx, STD_OUT
    mov ecx, num2
    mov edx, 0x5
    int SYS_CALL

    digite_novamente:
    mov ecx, opc1
    call mst_saida

    mov ecx, opc2
    call mst_saida

    mov ecx, opc3
    call mst_saida

    mov ecx, opc4
    call mst_saida

    mov ecx, msg_opc
    call mst_saida
    mov eax, SYS_READ
    mov ebx, STD_OUT
    mov ecx, opc
    mov edx, 0x5
    int SYS_CALL

    mov ah, [opc]
    sub ah, '0'

    cmp ah, 1
    je adicionar

    cmp ah, 2
    je subtrair

    cmp ah, 3
    je multiplicar

    cmp ah, 4
    je dividir

    mov ecx, msg_err
    call mst_saida
    jmp digite_novamente

adicionar:
    mov ecx, p1
    call mst_saida
    jmp saida

subtrair:
    mov ecx, p2
    call mst_saida
    jmp saida

multiplicar:
    mov ecx, p3
    call mst_saida
    jmp saida

dividir:
    mov ecx, p4
    call mst_saida
    jmp saida

saida:
    mov ecx, msg_end
    call mst_saida
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL
