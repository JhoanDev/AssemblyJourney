%include 'pascal.inc'

;1
;1 1
;1 2 1
;1 3 3 1


section .text
    global pasc

pasc:
    mov r8, rdi ; guarda a quantidade de linhas
    mov r9, 0x00 ; guarda a quantidade atual de linhas
    

_linha:
    call printa_quebra_de_linha
    cmp r9, r8
    je exit

    mov r10, r9 ;quantidade de colunas
    mov rbp, 0x00 ;quantidade atual de colunas
    jmp _coluna

_incrementa_linha:
    add r9, 0x01
    jmp _linha

_coluna:
    cmp rbp, r9
    jg _incrementa_linha

    call _calcula_enesimonumero
    call _printa_o_numero
    call printa_espaco


    add rbp, 0x01
    jmp _coluna

_printa_o_numero:
    call parse_string
    call printf
    ret

_calcula_enesimonumero:
    mov rax, 0x01
    mov r12, 0x00
    call _calcula_fatorial_linha
    mov r13, rax ;fatorial da linha 

    mov rax, 0x01
    mov r12, 0x00
    call _calcula_fatorial_coluna
    mov r14, rax ;fatorial coluna

    mov rax, 0x01
    mov r12, 0x00
    xor rdx, rdx
    add rdx, r9
    sub rdx, rbp
    call _calcula_fatorial_linha_menos_coluna
    mov r15, rax ; fat da subtracao da linha por coluna

    ; linha!/coluna!(linha-coluna)!
    xor rdx, rdx
    mov rax, r13
    imul r14, r15 
    div r14 ;valor final em rax
    ret
    

_calcula_fatorial_linha:
    add r12, 0x01
    imul rax, r12
    cmp r12, r9
    jl _calcula_fatorial_linha
    ret


_calcula_fatorial_coluna:
    add r12, 0x01
    imul rax, r12
    cmp r12, rbp
    jl _calcula_fatorial_coluna
    ret

_calcula_fatorial_linha_menos_coluna:
    add r12, 0x01
    imul rax, r12
    cmp r12, rdx
    jl _calcula_fatorial_linha_menos_coluna
    ret