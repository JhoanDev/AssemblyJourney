%include 'calculadora.inc'

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
    msg_err0 db LN,'Impossivel dividir por zero!!',EOS
    msg_end db LN,'Obrigado por utilizar meu programa!',LN,EOS

section .bss
    opc resb 1
    num1 resb 1
    num2 resb 1
    res resb 1

section .text
    global _start

_start:

fim: 
    mov eax, SYS_EXIT
    xor ebx, ebx
    int SYS_CALL 