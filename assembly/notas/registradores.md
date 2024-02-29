## Registradores

Na linguagem Assembly, os registradores são elementos fundamentais utilizados para armazenar dados temporários e realizar operações aritméticas e lógicas. Eles são peças-chave na interação direta com o processador e na manipulação de dados em nível de hardware. Neste contexto, vamos abordar os principais registradores de 64 bits (prefixo "r") e 32 bits (prefixo "e"):

#### Registradores de 64 bits (r):

- **rax**: Registrador usado para armazenar valores retornados de comandos.
- **rbx**: Registrador preservado, cujo conteúdo deve ser mantido ao longo da execução de uma função. Deve ser usado com cautela.
- **rcx**: Registrador de uso geral, frequentemente utilizado como contador em loops ou para armazenar valores temporários.
- **rdx**: Registrador de uso geral, empregado em diversas operações.
- **rsp**: Ponteiro de uma pilha, utilizado para gerenciar a alocação e desalocação de memória na pilha.
- **rbp**: Registrador preservado, frequentemente utilizado para armazenar o ponteiro de base da pilha em funções.
- **rdi**: Utilizado na passagem de argumentos para uma função, contém a quantidade de argumentos.
- **rsi**: Utilizado na passagem de argumentos para uma função, contém os próprios argumentos.

#### Registradores de 32 bits (e):

- **eax**: Versão de 32 bits do registrador acumulador (rax).
- **ebx**: Versão de 32 bits do registrador preservado (rbx).
- **ecx**: Versão de 32 bits do registrador de uso geral (rcx)
- **edx**: Versão de 32 bits do registrador de uso geral (rdx). 
- **esp**: Versão de 32 bits do registrador de ponteiro de pilha (rsp). 
- **ebp**: Versão de 32 bits do registrador preservado (rbp). 
- **edi**: Versão de 32 bits do registrador utilizado na passagem de argumentos (rdi).
- **esi**: Versão de 32 bits do registrador utilizado na passagem de argumentos (rsi).

Além desses, os registradores de r8 a r15 (64 bits) e r8d a r15d (32 bits) são utilizados para movimentações de dados e operações durante a programação em Assembly. Esses registradores são essenciais para manipular eficientemente os dados e controlar o fluxo de execução do programa diretamente na arquitetura do processador.