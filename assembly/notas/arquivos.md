# Arquivos em Assembly

## Contextos Importantes

- **File Descriptor**: O file descriptor é como o sistema operacional identifica o arquivo aberto na memória. Ele é fundamental para realizar operações como leitura, escrita e fechamento do arquivo.

- **Buffer**: O buffer é uma área de memória utilizada para armazenar os dados temporariamente enquanto são lidos do arquivo ou escritos nele.


## Criação do Arquivo

Para criar um arquivo em Assembly, configuramos os registradores de acordo com os parâmetros necessários para a syscall de criação de arquivo:

- **RAX**: Definimos como `0x08`, indicando ao sistema operacional que desejamos criar um arquivo.
- **RBX**: Apontamos para o endereço do nome do arquivo que desejamos criar.
- **RCX**: Definimos as permissões do arquivo em formato octal.
- **RDX**: Colocamos o tamanho do nome do arquivo.

Após configurar os registradores, chamamos a syscall para criar o arquivo.

### Permissões em RCX

As permissões são definidas em octal para economizar memória, utilizando três dígitos representando os níveis de acesso para usuário, grupo e outros.

Cada dígito pode ter um valor de 0 a 7, onde cada valor representa uma combinação de permissões:

- **1**: Executável (x)
- **2**: Gravável (w)
- **3**: Gravável e Executável (wx)
- **4**: Legível (r)
- **5**: Legível e Executável (rx)
- **6**: Legível e Gravável (rw)
- **7**: Legível, Gravável e Executável (rwx)

O formato geral para definir as permissões é `0oXXX`, onde cada `X` representa as permissões para o usuário, grupo e outros, respectivamente. Por exemplo, `0o664` significa:

- **6 (rw)**: Usuário tem permissão de leitura e escrita.
- **6 (rw)**: Grupo tem permissão de leitura e escrita.
- **4 (r)**: Outros têm permissão de leitura.

Essa configuração é passada no registrador `RCX` ao criar o arquivo.



## Escrita no Arquivo

Para escrever no arquivo, configuramos os registradores da seguinte maneira:

- **RAX**: Definimos como `0x04`, indicando a syscall de escrita.
- **RBX**: Apontamos para o file descriptor do arquivo que criamos.
- **RCX**: Indicamos os dados a serem escritos.
- **RDX**: Colocamos o tamanho dos dados a serem escritos.

Após isso, chamamos a syscall de escrita para realizar a operação.

## Leitura do Arquivo

Para ler um arquivo, configuramos os registradores da seguinte maneira:

- **RAX**: Definimos como `0x05`, indicando ao sistema operacional que desejamos abrir um arquivo para leitura.
- **RBX**: Informamos o endereço do nome do arquivo que desejamos abrir.
- **RCX**: Colocamos `0x00`, sinalizando que queremos abrir o arquivo para leitura.

Depois de abrir o arquivo, configuramos os registradores para a leitura dos dados:

- **RAX**: Definimos como `0x03`, indicando a syscall de leitura.
- **RBX**: Informamos o file descriptor do arquivo que abrimos.
- **RCX**: Apontamos para o buffer onde os dados lidos serão armazenados.
- **RDX**: Indicamos o tamanho máximo de bytes a serem lidos do arquivo.

## Fechamento do Arquivo

Após realizar todas as operações necessárias com o arquivo, é importante fechá-lo para liberar recursos do sistema e não corromper o arquivo. Configuramos os registradores da seguinte maneira:

- **RAX**: Definimos como `0x06`, indicando a syscall de fechamento de arquivo.
- **RBX**: Informamos o file descriptor do arquivo que desejamos fechar.

Em seguida, chamamos a syscall de fechamento de arquivo para liberar os recursos associados ao arquivo.