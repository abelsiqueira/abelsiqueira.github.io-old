---
layout: page
---

# Instalação do Jupyter pelo Docker

## Por Johnny Wellington dos Santos

Contextualizando

O Docker é uma ferramenta de conteinerização. No Linux ele vai rodar dentro de um contaminar a nível de Kernel, em sistemas como Windows e MacOS ele irá fazer esse processo dentro de uma VM Linux que ele mesmo gerencia.

A vantagem de usar algo assim é que simplifica o setup da coisa, mantendo todas as dependências juntas e isoladas do sistema hospedeiro.


Instruções:

1. Instalar o Docker seguindo as instruções para o seu sistema operacional
    Para Windows e MacOS basta executar o instalador.
    No Linux a coisa é um pouco mais divertida, aí você precisa seguir as instruções para cada distribuição.

    https://docs.docker.com/install/


2. Execute o seguinte comando no Terminal para Linux e MacOS, ou no CMD ou PowerShell do Windows.

    AVISO!
   
    A primeira vez que o comando for executado o Docker irá baixar a imagem que será utilizada.
    Essa imagem é enorme (6.23GB) por que se trata de um ambiente completo para Data Science em Julia, Python e R. 
    Por isso pode levar algum tempo dependendo da velocidade da conexão utilizada.

    $ docker run --name notebook -p 8888:8888 jupyter/datascience-notebook


3. Acesse o link que aparecer ao final da execução.

    Ele se parece com http://127.0.0.1:8888/?token=4b66bf01e0a37460ef8fa6f9248edbf5e1f0ab7a0359bf88

    Note o argumento token na URL, essa parte vai ser diferente para você.
    Isso é necessário apenas na primeira vez que você acessar para autenticar o servidor.
    Depois poderá acessar usando http://127.0.0.1:8888

4. Have Fun!


Após executar pela primeira vez você poderá interromper ou executar o container utilizando o nome atribuído (nesse caso é notebook).

    Interromper
    
    $ docker stop notebook


    Iniciar
 
    $ docker start notebook



