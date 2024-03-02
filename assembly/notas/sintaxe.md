# Sintaxe em Assembly

A linguagem Assembly é uma linguagem de baixo nível que possui uma sintaxe específica para realizar operações diretamente com os registradores e a memória do processador. Abaixo estão algumas das principais construções e conceitos relacionados à sintaxe em Assembly:

## Comentários

Os comentários em Assembly são indicados pelo ponto e vírgula `;`. Eles são usados para documentar o código e não têm efeito na execução do programa.

```assembly
; Este é um comentário em Assembly
```

## Seções

As seções em Assembly são usadas para organizar diferentes partes do código. Algumas das seções comuns são:

- `section .data`: Contém dados inicializados que serão utilizados pelo programa.
  
- `section .bss`: Contém variáveis não inicializadas que serão utilizadas pelo programa.
  
- `section .text`: Contém o código executável do programa.
  
- `segment`: É uma parte de uma seção.

```assembly
segment .data
    SYS_CALL equ 0x80   
    ; EAX ou RAX
    SYS_EXIT equ 0x01   ; Codigo de chamada para finalizar
    SYS_READ equ 0x03   ; Codigo de chamada para ler 
    SYS_WRITE equ 0x04  ; Codigo de chamada para escrever
    ; EBX ou RBX
    RET_EXIT equ 0x00   ; Retorno da chamada de finalização 
    STD_IN equ 0x00     ; Entrada padrão
    STD_OUT equ 0x01    ; Saída padrão

section .data
    msg db "Insira seu nome: ",LN,EOS
    tam equ $- msg

section .bss
    nome resb 1
```

## Ponto de entrada (_start)

O ponto de entrada de um programa Assembly é definido pela diretiva `global` seguida pelo nome `_start`. Este é o ponto onde a execução do programa começará.

```assembly
section .text
global _start
_start:
    ; Código de inicialização aqui
```

## Instruções

- `mov`: Utilizada para mover dados de uma localização para outra.
  
  ```assembly
  mov eax, 0x01 ; Move o valor 1 para o registrador eax
  ```

- `int`: Utilizada para chamar uma interrupção de software, que geralmente invoca um serviço do sistema operacional.

  ```assembly
  int 0x80 ; Chama a interrupção 0x80 (Linux syscall)
  ```

- `equ`: é usado para definir constantes simbólicas, atribuindo valores a símbolos. Isso é útil para criar nomes significativos para valores específicos.

    ```assembly
    SYS_EXIT equ 0x01     ; Código de chamada de sistema para finalizar o programa
    BUFFER_SIZE equ 64    ; Tamanho do buffer de entrada/saída
    ```

    Neste caso, `SYS_EXIT` e `BUFFER_SIZE` são substituídos por `0x01` e `64`, respectivamente, durante a montagem do código.


## Diretivas de Alocação de Memória

Na seção `.data` e `.bss`, é comum usar diretivas para alocar memória para variáveis e dados. Alguns exemplos incluem:

### Geralmente na .data são utilizados:
- `db`:     Aloca 1 byte de memória.
- `dw`:     Aloca 2 bytes de memória.
- `dd`:     Aloca 4 bytes de memória.
- `dq`:     Aloca 8 bytes de memória.
- `ddq`:    Aloca 10 bytes (para inteiros).
- `dt`:     Aloca 10 bytes (para decimais).

```assembly
section .data
    msg db 'Hello World!', 0x0A ; Aloca espaço para a string 'Hello World!' com um byte extra para a quebra de linha
    tam equ $- msg ; Calcula o tamanho da string
```

### Geralmente na .bss são utilizados

- `resb`:   Aloca 8 bits para a variável.
- `resw`:   Aloca 16 bits para a variável.
- `resd`:   Aloca 32 bits para a variável.
- `resq`:   Aloca 64 bits para a variável.
- `resdq`:  Aloca 128 bits para a variável.

O comando da seção `.bss` é bem diferente da seção `.data`, na `.data` por exemplo fazemos:

```assembly
var1 db 10
```
E isso significa que criamos uma variável chamada var1 com o valor 10 nela e esse valor foi armazenado
em uma variável de 8 bits.

Porém se definirmos em `.bss`:

```assembly
var1 resb 10
```

Estamos agora com um array de bytes contendo 10 elementos.
Por isso dizemos que em `.data` colocamos as constantes (mas na verdade também são expressões variáveis),
pois lá recebem valores iniciais enquanto que `.bss` temos as variáveis e não inicializadas (na verdade são arrays de
elementos).

## Comparação de valores e Condições

- `cmp`: compara valores de dois registradores

### Condições

As condições padrão mais comuns após uma instrução `cmp` são:

- `je`:     Salta se os valores forem iguais (Jump if Equal).
- `jne`:    Salta se os valores não forem iguais (Jump if Not Equal).
- `jg`:     Salta se o primeiro operando for maior que o segundo (Jump if Greater).
- `jng`:    Salta se o primeiro operando não for maior que o segundo (Jump if not Greater).
- `jl`:     Salta se o primeiro operando for menor que o segundo (Jump if Less).
- `jnl`:    Salta se o primeiro operando não for menor que o segundo (Jump if not Less).
- `jge`:    Salta se o primeiro operando for maior ou igual ao segundo (Jump if Greater or Equal).
- `jnge`:    Salta se o primeiro operando não for maior ou igual ao segundo (Jump if not Greater or Equal).
- `jle`:    Salta se o primeiro operando for menor ou igual ao segundo (Jump if Less or Equal).
- `jnle`:    Salta se o primeiro operando não for menor ou igual ao segundo (Jump if not Less or Equal).
  
```assembly
cmp eax, ebx     ; Compara os valores de eax e ebx
je label_equal   ; Salta para label_equal se eax for igual a ebx
jg label_greater ; Salta para label_greater se eax for maior que ebx
jl label_less    ; Salta para label_less se eax for menor que ebx
```

Essas condições são **saltos condicionais** ou seja, dependem que uma comparação ocorra. Porém
ainda existe o comando `jmp` que é um salto **incondicional**, isso é, não depende que nada ocorra. 

## AND_OR_XOR

Todos eles funcionam comparando bit a bit de dois dados, e retornam um valor

### AND

No `and` é necessario que os dois bits comparados sejam 1 para retornar 1, ou seja o único par onde retorna 1 é no par (1,1).

    (0,0) = 0
    (1,0) = 0
    (0,1) = 0
    (1,1) = 1

### OR

No `or` é necessario que pelomenos um dos bits comparados seja 1, ou seja único caso onde retorna 0 é no par (0,0).

    (0,0) = 0
    (1,0) = 1
    (0,1) = 1
    (1,1) = 1

### XOR

No `xor` funciona caso os dois bits sejam iguais retorna 0, caso diferentes retorna 1

    (0,0) = 0
    (1,0) = 1
    (0,1) = 1
    (1,1) = 0

#### Exemplo:

        AND     OR      XOR
    7 - 0111    0111    0111
    5 - 0101    0101    0101
        0101    0111    0010
        5       7       2

## Operações matématicas

`add`: Soma dois dados e armazena no primeiro registrador, análogo ao `+=` em `C`

```assembly
mov r8d, 0x07 ; movendo o valor 7 para o registrador r8d
add eax, r8d ; adicionando o que está no registrador r8d ao eax
```

`sub`: Subtrai dois dados e armazena no primeiro registrador, análogo ao `-=` em `C`

```assembly
mov r8d, 0x07 ; movendo o valor 7 para o registrador r8d
sub eax, r8d ; subtraindo do que está no registrador r8d ao eax
```

`imul`: multiplica dois dados e armazena no primeiro registrador, análogo ao `*=` em `C`

```assembly
imul ebx, 0x0A ; Multiplica o valor contido no registrador ebx por 10.
```

## Apontadores

`lea`: Ele pega o endereço da memoria de uma "variavel" e coloca o endereço no registrador indicado;

```assembly
lea esi, [BUFFER] ;tudo que ocorrer com o valor BUFFER a partir desse momento irá refletir no esi pois esão apontando para o mesmo endereço
```

`[]`: Os colchetes servem normalmente para indicar que o dado naquele endereço deve ser acessado, pode ser análogo ao `*` em .

Quando na intrução lea ele tem significado diferente, ele é utilizado para dizermos que queremos calcular o endereço de memória do dado.

```assembly
lea esi, [BUFFER] ; calculando e armazenando o endereço de BUFFER
```

## Chamadas e Retornos

`call`: Quando a instrução call é executada, o endereço de retorno (o endereço da próxima instrução após a call) é colocado na pilha (stack).
Em seguida, o fluxo de controle é transferido para a "função" chamada

```assembly
_start:
    call converte_valor 
    call mostrar_valor
```

`ret`: Quando a instrução ret é executada, o endereço de retorno é retirado da pilha e o controle é transferido de volta para o endereço de retorno (Onde a call desse bloco foi chamada), continuando a execução a partir desse ponto.

```assembly
converte_valor:
    lea esi,[v1]
    mov ecx, 0x01
    call string_to_int ; chamou outra "função"
    add eax, 0x02
    ret ; retornou para o fluxo principal
```
