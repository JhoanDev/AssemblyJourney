# Unindo um arquivo .cpp com um .asm

## Introdução
Os seguintes passos são necessários para unir um arquivo escrito em C++ com um arquivo em assembly (`.asm`). Vamos usar como exemplo um programa simples em C++ que chama uma função definida em um arquivo assembly.

### Exemplo de código C++ (.cpp)
```cpp
#include <iostream>

using namespace std;

extern "C" int get_valor_asm(int a);

int main()
{
    cout << "ASM me deu: " << get_valor_asm(32) << endl;
    return 0;
}
```
Substitua `nome_do_executavel` pelo nome escoSubstitua `nome_do_executavel` pelo nome escolhido no Passo 2.
lhido no Passo 2.

### Exemplo de código Assembly (.asm)
```assembly
section .text

global get_valor_asm

get_valor_asm:
    mov eax, edi ; quando um valor é enviado por outro programa, ele é recebido pelo registrador edi e retorna pelo registrador eax
    add eax, 1
    ret
```

## Compilando e unindo os arquivos

### Passo 1: Compilação do código Assembly
Primeiro, vamos compilar o código assembly usando o NASM para gerar um arquivo objeto (`.o`). Utilizaremos o seguinte comando:

```bash
nasm -f elf64 arquivo.asm
```

Substitua `arquivo.asm` pelo nome do seu arquivo assembly.

### Passo 2: Compilação do código C++
Agora, vamos compilar o código C++ junto com o arquivo objeto gerado no passo anterior. Utilizaremos o seguinte comando:

```bash
g++ arquivo.o arquivo.cpp -o nome_do_executavel
```

Substitua `arquivo.o` pelo nome do arquivo objeto gerado no Passo 1, `arquivo.cpp` pelo nome do seu arquivo C++, e `nome_do_executavel` pelo nome desejado para o executável.

### Passo 3: Execução
Após a compilação bem-sucedida, você pode executar o programa usando o seguinte comando:

```bash
./nome_do_executavel
```