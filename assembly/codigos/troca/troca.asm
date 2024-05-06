section .text 

global get_valor_asm

get_valor_asm:
    mov eax, edi ;quando eu mando um valor por outro programa, ele vem pelo edi e volta pelo eax
    add eax, 1
    ret
