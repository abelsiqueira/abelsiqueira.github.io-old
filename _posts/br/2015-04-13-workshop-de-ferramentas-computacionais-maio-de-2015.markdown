---
layout:     post
title:      Workshop de Ferramentas Computacionais - Maio de 2015
date:       2015-04-13
categories: public-utility
name:       workshop-2015-05-30
permalink:  workshop-2015-05-30
---
**Este site está sendo construído**

# Sobre

No dia 30 de Maio de 2015 acontecerá uma Oficina de Ferramentas Computacionais
para Pesquisadores.
Essa oficina será focada em três ferramentas básicas para desenvolvimento de
software:

  - Bash
  - Git
  - Julia

O Bash é o terminal tradicinal dos sistemas GNU/Linux (a tela preta).
As possibilidades de uso são ilimitadas, mas vamos forcar em conhecer o básico,
na tentativa de chegar até a criação de um script simples.

O Git é uma ferramenta para controlar versões de softwares e outros arquivos.
Você consegue guardar versões anteriores dos seus arquivos, assim como versões
alternativas, com uma estrutura escondida que melhora a organização e o design.
Ela é usada principalmente para controle de versões de software, permitindo que
cada programador saiba o que foi feito por quem e quando, mas também pode ser
utilizado para controle de versões de artigos, teses e apresentações.
O [modelo de tese do IMECC - UNICAMP](https://github.com/lpoo/modelo_tese_imecc)
usa o Git, e este site está [armazenado usando o
Git](https://github.com/abelsiqueira/abelsiqueira.github.io).
É uma das ferramentas principais para gerenciamento de versões, e [muitos
projetos importantes o usam](https://git.wiki.kernel.org/index.php/GitProjects).
O Git pode ser usado apenas em seu computador, mas o uso comum envolve algum
servidor remoto (principalmente para colaboração). A oficina tentará mostrar um
pouco de cada.

Julia é uma nova linguagem de programação que tem o objetivo de ser rápido como
C/Fortran, permitindo uma interfaca simples entre C e Fortran, e com sintaxe
parecida com a de Matlab e Python.
Como é uma linguagem livre, acreditamos ser uma escolha melhor que o Matlab para
software livre.
Também é uma boa linguagem inicial por ser prática, e tem muito espaço para
expansão por nova.

# Requerimentos

Para participar da oficina voce **precisa de um computador portátil**
com alguns softwares instalados.
**Idealmente**, um computador com algum tipo Unix (Ubuntu, Fedora, OSX) é melhor
para o desenvolvimento _na opinião do autor da página_.
[Veja
discussões](http://www.quora.com/Is-it-important-for-modern-programmers-to-know-use-Unix-Why).
Além disso, os instrutores não tem o conhecimento para dar suporte completo no
Windows.

Softwares que você precisa

  - Bash
    - No GNU/Linux, o Bash já deve estar instalado.
    Procure pelo `terminal` ou `console` no seu sistema. Quando ele abrir,
    digite

          bash --version

    Uma mensagem deve aparecer indicando qual versão está instalada.

    - No OSX, o terminal padrão também é o Bash. Você pode acessar pelo
    `/Applications/Utilities/`. Dica: coloque o terminal no dock.

    - No Windows existem algumas opções,
    uma delas é o [Git Bash](http://msysgit.github.io/), que você já usa para o
    Git também.

  - Git
    - No Windows, instale o [Git Bash](http://msysgit.github.io/), que falei
    acima.
    **Nota**: Uma das opções da instalações é sobre o fim de linha (line
    ending). Escolha a opção de seguir o padrão Unix (ou algo parecido).

    - No OSX, você pode instalar o Git para Mac baixando um instalador
    [aqui](http://sourceforge.net/projects/git-osx-installer/files/).

    - Num computador tipo Unix, siga as [instruções](http://git-scm.com/downloads).
      Teste que o git foi instalado fazendo

          git --version

      no seu terminal.

  - Julia: Siga as [instruções](http://julialang.org/downloads/).
    **Instale uma versão nightly**.
    Para testar, verifique que o Julia foi instalado abrindo o terminal de
    Julia, e verificando que o texto introdutório contém `Version 0.4.0`.

  - Um editor de texto, preferencialmente com suporte a UTF-8, código colorido
    automaticamente, indentação automática e inclusão de espaços no lugar de
    TAB. Existem algumas opções, e se você não tem preferência nenhuma, o
    [atom.io](https://atom.io/) é um bom para começar. Se for usá-lo,
    recomendamos buscar pelo pacote `language-julia`.

**Certifique-se de ter essas ferramentas instaladas ANTES do evento**.

# Inscrições

Acesse [o link](https://pt.surveymonkey.com/s/NZB3LDJ) e preencha o
questionário.

# Cronograma

O evento acontecerá no dia 30 de Maio de 2015, seguindo o cronograma abaixo:
(*Nota: Mudamos o horário de Julia para melhor acomodar o cronograma*).

  - **08:00** : Abertura
  - **08:30** : Bash (com Raniere)
  - **09:30** : _Coffee Break_
  - **10:00** : Julia (com Abel)
  - **11:30** : Almoço
  - **13:30** : Git Local (com Abel)
  - **15:00** : _Coffee Break_
  - **15:30** : Git Remoto (com Raniere)
