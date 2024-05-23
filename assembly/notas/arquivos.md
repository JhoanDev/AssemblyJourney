# Leitura de Arquivos em Assembly

## Contextos Importantes

- **File Descriptor**: O file descriptor é como o sistema operacional identifica o arquivo aberto na memória. Ele é fundamental para realizar operações como leitura, escrita e fechamento do arquivo.

- **Buffer**: O buffer é uma área de memória utilizada para armazenar os dados temporariamente enquanto são lidos do arquivo ou escritos nele.

## Modo de Leitura

### Abertura do Arquivo

Para abrir um arquivo e prepará-lo para leitura, configuramos alguns registradores:

- **RAX**: Definimos como `0x05`, indicando ao sistema operacional que desejamos abrir um arquivo.
- **RBX**: Informamos o endereço do nome do arquivo que desejamos abrir.
- **RCX**: Colocamos `0x00` aqui, sinalizando que queremos abrir o arquivo para leitura.

Após isso, chamamos a syscall correspondente para abrir o arquivo. O file descriptor retornado (armazenado em RAX) é crucial e deve ser mantido para usos futuros.

### Leitura do Arquivo

Depois de abrir o arquivo, podemos prosseguir com a leitura dos dados. Configuramos os registradores para a leitura:

- **RAX**: Definimos como `0x03`, indicando a syscall de leitura.
- **RBX**: Informamos o file descriptor do arquivo que abrimos.
- **RCX**: Apontamos para o buffer onde os dados lidos serão armazenados.
- **RDX**: Indicamos o tamanho máximo de bytes a serem lidos do arquivo.

Chamamos então a syscall de leitura para executar a operação. Após a leitura, os dados do arquivo estarão disponíveis no buffer que especificamos.

## Fechamento do Arquivo

Depois de realizar todas as operações necessárias com o arquivo, é importante fechá-lo para liberar recursos do sistema. Configuramos os registradores para fechar o arquivo:

- **RAX**: Definimos como `0x06`, indicando a syscall de fechamento de arquivo.
- **RBX**: Informamos o file descriptor do arquivo que desejamos fechar.

Em seguida, chamamos a syscall de fechamento de arquivo para concluir a operação. Após o fechamento do arquivo, o file descriptor não será mais válido e os recursos associados ao arquivo serão liberados.