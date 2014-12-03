---
layout:     post
title:      O Fim de Fortran
date:       2014-11-22
categories: research
name:       endoffortran
---
Um de meus principais interesse é o fim de Fortran **como a única linguagem de
programação usada por matemáticos**.
Se você não é da área de programação matemática, provavelmente vai achar
estranho que eu esteja falando de Fortran, então explicarei.
Fortran é considerada a linguagem de programação mais rápida na matemática, e a
maior parte das coisas são feitas nessa linguagem. Outras linguagens usadas
frequentemente, como MatLab/Octave e Mathematica são de alto nível, o que
significa que elas são mais lentas e não são consideradas para aplicações
sérias.

Na realidade, Fortran é uma das linguagens de programação mais rápidas **para
álgebra linear com matrizes densas**. Como a maior parte das coisas são
matrizes, e vetores são densos, não dá pra ignorar isso.
Além disso, Fortran é relativamente fácil de se lidar, se você ignorar a
horrível formatação e o GOTO, que foram deixados pra trás pelas novas versões.

O problema é que, como aprender Fortran é quase imperativo na área, existe pouca
coisa além dele que é usada na área. Então, tarefas simples que não precisam de
execução rápida se tornam problemas difíceis de programação. Além disso, tarefas
que precisam de execução rápida, mas que não podem (não devem) ser implementadas
como matrizes, se tornam lentas em Fortran, e às vezes isso é ignorado.

Minha proposta é **use a melhor ferramenta para o trabalho**, que é apenas bom
senso aplicado à nossa área. Experimente [Python](http://www.python.org).
Experimente [Ruby](http://www.ruby-lang.org).
Experimente [Julia](http://www.julia-lang.org).
Experimente implementar um grafo usando lista de ponteiros.
Experimente implementar um parseador (analisador sintático?) de argumentos.
Experimente implementar algo para ler, guardar e calcular a transposta de uma
matriz esparsa.
Experimente implementar uma ferramenta que lê todas as citações do seu .tex, lê
de um arquivo bibtex tais referências e as imprima numa formatação legal.

Agora, ao invés de ficar nessa linguagem, vá pra outra.
Tente outras linguagens.
Quando o trabalho chegar, você pode escolher a melhor ferramenta para ele.
E você pode combinar.
Alguns linguagens, como Julia, Fortran e C, são muito fáceis de combinar com
outras.
E se você realmente está precisando de velocidade, porque não implementar a
parte pesada em linguagem de máquina (ASSEMBLY)?
Implementar da maneira mais rápida é muito bom para uma aplicação específica,
mas na nossa linha de trabalho, precisamos levar em conta o método, não apenas a
implementação.
