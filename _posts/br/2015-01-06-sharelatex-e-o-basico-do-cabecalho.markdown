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
[ShareLaTeX](https://pt.sharelatex.com/)
que é um editor e compilador de LaTeX online.

Além disso, para não começar do nada, copie o seguinte código.

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
