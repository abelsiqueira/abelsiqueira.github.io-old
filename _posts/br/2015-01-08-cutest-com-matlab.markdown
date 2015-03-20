---
layout:     post
title:      CUTEst Com Matlab
date:       2015-01-08
categories: research
name:       cutest-com-matlab
---
No meu [vídeo do YouTube](https://www.youtube.com/watch?v=pM7FmOXHyns),
eu ensinei como se faz para instalar o CUTEst. Hoje estendo a instalação
para instalar o MatLab também, mas para uma instalação mais detalhada,
talvez o vídeo seja mais indicado.

Inicialmente instale o Matlab. Não vou entrar em detalhes, mas atente-se a duas
coisas:
  
  - Algumas versões do matlab não colocam o executável num lugar "visível pelo
    terminal".
    Para resolver, usando o bash, adicione o caminho dos executáveis do MATLAB
    ao PATH no arquivo `~/.bashrc`.
    Por exemplo, adicionando
        
        PATH=/usr/local/MATLAB/R20XXc/bin:$PATH

  - Você vai precisar do `mex` (um link para ele é suficiente) no \bin.
    Para resolver, pode fazer um link a partir do caminho original
      
        $ sudo ln -s /usr/local/MATLAB/R20XXc/bin/mex /bin/

Depois de instalado o Matlab,
vamos instalar o CUTEst. Você precisará do `subversion` instalado (que
disponibiliza o comando `svn`), e do compilador de fortran.
**A versão do compilador de fortran depende da versão do Matlab.**

  | Versão do Matlab    | Versão do compilador |
  |:-------------------:|:--------------------:|
  | Antes do R2011a     |            g95       |
  | R2011a - R2013a     |   gfortran-4.4       |
  | R2013b ou mais novo |   gfortran-4.7       |

Crie ou escolha uma pasta para as biblioteca do cutest.
A nossa será `$HOME/libraries`.
Nessa pasta baixe os repositórios CUTEst usando o subversion.
Siga os passos da [wiki
oficial](http://ccpforge.cse.rl.ac.uk/gf/project/cutest/wiki/),
ou copie os comandos abaixo para um arquivo `baixacutest.sh`.

    #!/bin/bash

    cmd="svn checkout -q --username anonymous --password "" --non-interactive --no-auth-cache"
    url="http://ccpforge.cse.rl.ac.uk/svn/cutest/"
    for name in archdefs sifdecode cutest sif
    do
      echo "Downloading $name"
      $cmd $url/$name/trunk ./$name
    done
    
Para executar esse arquivo, rode os comandos

    $ chmod a+x baixacutest.sh
    $ ./baixacutest.sh

Entre na pasta `$HOME/libraries/archdefs` e rode o comando
`install_optsuite`.
Responda as perguntas para instalar o CUTEst e sua família.

Depois da instalação, o CUTEst soltará várias informações que
você deve guardar no seu `$HOME/.bashrc`. As minhas
informações estão abaixo. Você pode modificar para corresponder
à sua configuração.

    LIBS=$HOME/libraries
    export ARCHDEFS="$LIBS/archdefs"
    export SIFDECODE="$LIBS/sifdecode"
    export CUTEST="$LIBS/cutest"
    export MASTSIF="$LIBS/sif"
    export PATH="$CUTEST/bin:$SIFDECODE/bin:$PATH"
    export MANPATH="$CUTEST/man:$SIFDECODE/man:$MANPATH"
    export MYARCH="pc64.lnx.gfo"
    export MYMATLABARCH="pc64.lnx.gfo"
    export MYMATLAB="/usr/local/MATLAB/RXXXX/"

Para fazer o Matlab funcionar com o CUTEst, você decodifica o arquivo `SIF`
para o format `mex` do matlab. Daí, você tem que abrir o Matlab naquela pasta,
ou inserir o path dessa pasta.
Aí você usa os comandos do cutest para acessar as propriedades do problema.
O primeiro comando que você vai usar é o

    prob = cutest_setup()

Para acessar a função objetivo, você pode usar

    f = cutest_obj(x)
    [f,g] = cutest_obj(x) % já retorna o gradiente também

Para acessar o gradiente, você pode usar

    g = cutest_grad(x)

Além disso, existem outras funções que você pode usar.
A lista está no apêndice B do
[Technical Report do CUTEst]({{ site.baseurl }}/assets/cutest-techreport.pdf).

Para testar sua instação, você pode copiar o programinha a seguir,
que tenta encontrar o minimizador de uma função através do método
de máxima descida.

    function [x,fx,k] = steep(x, f, g)

    kmax = 1e4;
    alpha = 0.5;
    eps = 1e-4;

    fx = f(x);
    gx = g(x);
    
    k = 1;
    while norm(gx) > eps
      t = 1;
      while f(x-t*gx) > fx - alpha*t*dot(gx,gx)
        t = t*0.9;
      end
      x = x - t*gx;
      fx = f(x);
      gx = g(x);
      k = k + 1;
      if k > kmax
        return
      end
    end

Copie esse conteúdo para um arquivo `steep.m`, e abra o Matlab.
No terminal, vá até a pasta em que está esse arquivo e rode:

    $ cutest2matlab BARD

No matlab, vá até a pasta que está esse arquivo e rode

    prob = cutest_prob();
    [sol, fx, k] = steep(prob.x, @(x) cutest_obj(x), @(x) cutest_grad(x))

A solução do problema deve ser perto de `(0.08,1.14,2.33)` e `f = 0.0082`.
