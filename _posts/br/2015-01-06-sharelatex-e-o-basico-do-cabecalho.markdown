---
layout:     post
title:      "ShareLaTeX e o básico do cabeçalho"
date:       2015-01-06
categories: public-utility
name:       latexheaderbasic
---
Este post serve principalmente para meus alunos e outros interessados em começar
a usar o LaTeX. A primeira coisa a se notar é que instalar o compilador é bem
chato e complicado, então sugiro usarem o
[ShareLaTeX](https://www.sharelatex.com?r=09a71589&rm=d&rs=b)
que é um editor e compilador de LaTeX online.
O ShareLaTeX possui
[uma boa documentação para quem está começando](https://pt.sharelatex.com/learn)
que infelizmente não está traduzida para português.
Uma outra recomendação para quem está querendo ler sobre antes de começar a
utilizar é
http://en.wikibooks.org/wiki/LaTeX.

Além disso, para não começar do nada, copie o seguinte código

    \documentclass{article}
    \usepackage[utf8]{inputenc}
    \usepackage[T1]{fontenc}
    \usepackage[portuguese]{babel}
    \usepackage[top=2cm,bottom=2cm,left=1cm,right=1cm]{geometry}
    \usepackage{amsmath, amsfonts}

    \title{Título}
    \author{Abel Soares Siqueira}
    \date{6 de Janeiro de 2015}

    \begin{document}

    \maketitle

    Algo

    \end{document}

no ShareLaTeX e comece a descobrir as coisas.

E não mais importante, se você tiver uma pergunta relacionada ao LaTeX tente
[Stack Exchange do Tex](http://tex.stackexchange.com/).
