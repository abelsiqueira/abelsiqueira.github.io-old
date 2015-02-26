---
layout:     post
title:      Apresentação no VII Simpósio de Análise Numérica e Otimização - UFPR
date:       2015-02-25
categories: curriculum
name:       vii-simposio
---
No dia 24 de Fevereiro de 2015 aconteceu o (primeiro dia do) VII Simpósio de
Análise Numérica e Otimização.
Participei deste congresso fazendo uma apresentação sobre
[Ferramentas Computacionais para
Pesquisadores](/assets/2015-02-25-vii-simposio.pdf)
(ver [código](http://github.com/abelsiqueira/pres-ferramentas-computacionais)).

Nesta apresentação, introduzo algumas ferramentas que considero bastante
importantes para pesquisadores, principalmente da área de matemática
computacional.
Um resumo do que apresento é

  - Aprenda outras linguagens. Recomendo, por exemplo, conhecer Python ou Ruby,
    Shell e Makefile. Com essas ferramentas já é possível automatizar testes e
    fazer scripts com uso variado. Makefile, por exemplo, é uma das maneiras
    mais usadas de se instalar programas (no Unix).
  - Conheça a linguagem [Julia](http://www.julialang.org).
    É uma linguagem com foco na matemática computacional, considerando ainda que
    você irá querer utilizar código em C e Fortran, e com sintaxe parecido com a
    de MatLab/Octave. É uma linguagem nova, mas tem potencial para ser o próximo
    concorrente do MatLab/Octave, e é livre.
    - Dentro do Julia, conheça o [JuliaOpt](http://www.juliaopt.org), que é
      um grupo que está desenvolvendo ferramentas de otimização em Julia.
      Desde interfaces para softwares conhecidos, até linguagens de modelagem,
      passando por implementações de métodos de otimização não-linear, tanto
      puramente em Julia, quanto utilizando códigos de baixo nível.
    - Também anunciei que estamos trabalhando no
      [CUTEst.jl](http://github.com/optimizers/CUTEst.jl), uma interface para o
      [CUTEst](http://ccpforge.cse.rl.ac.uk/gf/project/cutest/wiki).
  - Escolha um editor e um ambiente de desenvolvimento.
    Sugiro ver algumas opções (Vim, Emacs, Atom, Sublime Text, Eclipse), testar,
    e ver qual combina mais com você. Em adição, conheça o Sharelatex e/ou o
    Writelatex.
  - Conheça o [perprof-py](http://github.com/abelsiqueira/perprof-py),
    que é uma ferramenta para gerar perfis de desempenho, com gráficos de alta
    qualidade.
  - Conheça o [git](http://git-scm.com), que é uma ferramenta para controle de
    versão, que você pode usar sozinho; ou em grupo; fazer ramificações;
    verificar versões anteriores; misturar versões; trabalhar online; dentro
    outras.
    - Conheça o [GitHub](http://github.com), que é um site onde você pode
      colocar o código que foi feito com git.
    - Conheça o [Travis CI](http://travis-ci.org), que é um serviço que baixa
      seu código do GitHub e roda testes (definidos por você) nele, sempre que
      você subir o seu código.
    - Conheça o [Coveralls.io](http://coveralls.io), que é um serviço que
      verifica seus testes e diz que parte do seu código foi verificado, e qual
      não foi.
  - TikZ e PgfPlots do Latex: Comentei um pouco sobre gráficos usando esses
    pacotes, e mostrei alguns exemplos.

Também falei sobre o [Software Carpentry](http://www.software-carpentry.org),
que é uma organização sem fins lucrativos que realiza workshops e promove
conhecimento mundialmente. Comentei também sobre o trabalho do
[Raniere Silva](http://rgaiacs.com) no Software Carpentry, e do
[trabalho que ele está
propondo](http://catarse.me/pt/programacaocientifica) para os próximos meses.

Algumas boas perguntas foram feitas, e gostaria de parafraseá-las e
atualizar minha resposta para algumas delas.

  - **Por que sair do MatLab para o Julia?**
    Recomendo sair do MatLab porque ele é um software proprietário, pra começar.
    Mas desconsiderando isso, e também considerando o Octave, dou a seguinte
    resposta: O Julia está sendo desenvolvido com o intuito de substituir o
    MatLab, sabendo que o matemático computacional costuma fazer código que
    precisa de velocidade em C ou Fortran.
    A interface para C e Fortran em Julia é consideravelmente fácil,
    e isso facilita o processo de criar um código que você vê que funciona, e
    posteriormente otimizá-lo.
    Gostaria de acrescentar a ressalva que Julia é uma linguagem nova, e
    obviamente não tem tudo que gostaríamos implementado. Seu código pode
    quebrar. Mas vale a pena conhecer para saber se vale investir.
  - **Por que sair do Python para o Julia?**
    Não sei se você deve. O Python básico não é suficiente para um matemático
    computacional, mas eu sei que existem vários pacotes que conseguem deixar o
    Python muito eficiente para Análise Numérica e Otimização. Também é possível
    fazer uma transição C com Python, mas não conheço, logo não posso julgar.
    Atualmente, provavelmente, o Python parece ser mais eficiente.
    E já que estamos aqui, se você conseguir tirar alguém do MatLab para o
    Python, já é uma vitória.
  - **Por que usar o TikZ/PgfPlots no lugar desta outra ferramenta de
    gráficos?**
    Se for o MatLab, vide meu _rant_ anterior sobre MatLab ser proprietário.
    Para outras ferramentas, não sei. Muitas ferramentas fazem um trabalho, no
    mínimo, tão bom quanto o TikZ/PgfPlots, e.g., o MatplotLib (que
    usamos no perprof, junto com o PgfPlots).
    Uma coisa que eu gosto é misturar com o Beamer, gerando figuras iterativas
    (não interativas).
    Então, alguns comandos podem ser misturados para fazer uma sequência de
    figuras que o Beamer vai descobrindo (por exemplo o caminho de um
    algoritmo).
  - **Se fosse para você escolher apenas uma dessas ferramentas para
    recomendar, qual seria?**
    Sem dúvida o git, que é útil para qualquer área onde você escreve código, ou
    até mesmo um artigo em .tex (ou outros formatos binários de texto).
    Você nunca sabe quando vai precisar voltar numa versão anterior do código.
    Por exemplo, você faz atualizações no seu código, e alguém diz que estava
    usando o seu código antes, mas depois que essa pessoa atualizou, o código
    parou de funcionar.
    Bem, como fazer pra saber o que quebrou o código? Se você está fazendo o
    controle corretamente, você terá vários _commits_ indicando o trabalho
    feito. Você pode navegar nesses commits e descubrir a última versão que
    funcionava. Assim você reduz consideravelmente a quantidade de código que
    pode ter estragado o seu pacote.
    Além disso, você pode trabalhar com versões paralelas, colaborativamente, e
    ainda aproveitar de serviços fantásticos para quem usa git (GitHub, Travis,
    Coveralls).

É importante ficar claro que eu não estou apresentado as melhores ferramentas
para seus respectivos objetivos, apenas aquelas que eu conheço e que podem
resolver o problema. Talvez alguma ferramenta seja melhor do que a que eu
apresentei, mas o ponto é você conhecer alguma ferramenta, e às vezes conhecer
alguma nova.
