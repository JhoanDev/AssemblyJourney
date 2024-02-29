## Como funciona o arquivo Makefile

O arquivo Makefile é um componente crucial em sistemas Unix e Unix-like, utilizado para automatizar processos de compilação e execução de tarefas relacionadas a programas. Ele é especialmente útil quando se trabalha com linguagens de programação de baixo nível, como Assembly.

### Estrutura básica do Makefile

Um Makefile é composto por regras, cada uma contendo um target , uma lista de dependências e os comandos associados. A estrutura básica de uma regra em um Makefile segue o seguinte padrão:

```
target: dependências
    comando1
    comando2
    ...
```

- **target**: Representa o objetivo a ser alcançado, como um arquivo executável.
- **Dependências**: Lista de arquivos ou targets que o target atual depende. Se algum dos arquivos de dependência for modificado, o target será reconstruído.
- **Comandos**: Lista de comandos a serem executados para criar o target. Eles são precedidos por uma tabulação (pressão da tecla `Tab`).

### Exemplo simples de Makefile

```makefile
NOME = entrada

target: $(NOME).o
    ld -s -o main $(NOME).o
    rm -rf *.o
    clear

%.o: %.asm
    nasm -f elf64 $<
```

Neste exemplo:
- O target é definido como `target`.
- O arquivo fonte Assembly é especificado como `$(NOME).asm`.
- O comando para compilar o arquivo Assembly e criar o executável é dado pela linha `nasm -f elf64 $<`.

## Utilização do Makefile

Para utilizar este Makefile, basta executar o comando `make` no terminal, estando no diretório onde o Makefile está localizado. Isso executará os comandos associados ao target padrão, que é `target`. No caso específico deste Makefile, o arquivo de entrada será compilado e o executável resultante será gerado.

```bash
make
```

Este comando irá verificar se o arquivo de entrada `entrada.asm` foi modificado desde a última compilação. Se sim, ele executará o comando associado para compilar o arquivo e gerar o executável `main`.