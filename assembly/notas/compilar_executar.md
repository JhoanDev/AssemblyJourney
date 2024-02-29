## Compilação e Link-Edição em Assembly usando NASM

Para compilar um código em assembly usando o compilador NASM, utilizamos o seguinte comando:

```bash
nasm -f elf64 nomedoprograma.asm
```

Onde:
- `-f elf64` especifica o formato de saída como ELF de 64 bits, adequado para sistemas operacionais baseados em Linux de 64 bits.

Após a compilação, o arquivo gerado será um arquivo objeto (com extensão .o). Para linkeditar, ou seja, transformar o arquivo objeto em um executável, usamos o seguinte comando:

```bash
ld -s -o main nomedoprograma.o
```

Onde:
- `-s` significa "stripping", que remove informações desnecessárias do executável, tornando-o menor.
- `-o main` especifica o nome do arquivo de saída como "main", mas você pode substituir "main" pelo nome desejado para seu executável.

Para executar :

```bash
./main
```