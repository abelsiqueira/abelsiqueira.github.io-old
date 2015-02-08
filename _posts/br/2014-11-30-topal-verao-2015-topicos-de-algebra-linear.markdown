---
layout:     post
title:      TopAL - Verão 2015 - Tópicos de Álgebra Linear
date:       2014-11-30
categories: disciplines
name:       topal-summer2014
---
**Atualizado: 08 de Fevereiro de 2015, 19:28**

# Informações

  | **Local:**   | PC01
  | **Horário:** | 10h-12h, Seg, Ter, Qui, Sex
  | **Início:**  | 5 de Janeiro de 2015
  | **Término:** | 6 de Fevereiro de 2015
  | **Data da primeira prova:** | 22 de Janeiro de 2015

# Ementa

Espaços vetoriais, base e dimensão.
Transformaçõees lineares e matrizes.
Autovalores e autovetores, diagonalização de operadores.
Teoria espectral.
Espaços com produto interno, bases ortonormais, e
processo de ortogonalização.
Tipos especiais de operadores lineares.

# Listas

  - [Lista 1](/disciplinas/topal2015/lista1.pdf)
  - [Lista 2](/disciplinas/topal2015/lista2.pdf)
  - [Lista 3](/disciplinas/topal2015/lista3.pdf)
  - [Lista 4](/disciplinas/topal2015/lista4.pdf)
  - [Lista 5](/disciplinas/topal2015/lista5.pdf)
  - [Lista 6](/disciplinas/topal2015/lista6.pdf)
    **Tinha um erro na lista 6, e ela foi atualizada.**

# Projetos

  - [Projeto 1](/disciplinas/topal2015/projeto1.pdf), Arquivos auxiliares de
    [Octave/Matlab](/disciplinas/topal2015/octave-auxiliar.tar.gz), e
    [Julia](/disciplinas/topal2015/julia-auxiliar.tar.gz).
    - Dica: [pacote listings do
      LaTeX](http://en.wikibooks.org/wiki/LaTeX/Source_Code_Listings)

# Gabaritos

  - Exercício 1: [pdf](/disciplinas/topal2015/ex2015-01-06.pdf) e
    [tex](/disciplinas/topal2015/ex2015-01-06.tex)
  - Exercício 2 está no livro do Roman.
  - Exercício 3:

        function d = prodint(x,y)
        n = length(x);
        s = 0.0;
        for i = 1:n
          s = s + x(i)*y(i);
        end
  - [Prova 1](/disciplinas/topal2015/prova1.pdf)
  - [Prova 2](/disciplinas/topal2015/prova2.pdf)

# Recursos online

  - Compiladores e interpretadores online:
    - [Python e R](https://www.getdatajoy.com);
    - [Octave](http://octave-online.net/);
    - [Julia, C/C++, Fortran e outros](http://www.tutorialspoint.com/codingground.htm);
    - [Latex](https://www.sharelatex.com/?r=09a71589&rm=d&rs=b).
  - [Github](https://github.com/): Uma ferramenta para armazenamento de
    repositórios criados com o [git](http://git-scm.com/).
  - [Travis CI](https://travis-ci.org/): Uma ferramenta para testes automatizados
    com integração com o Github.
  - [Atom.io](https://atom.io/): Um editor multi-propósito.
  - [Slides interpretando visualmente o
    Gram-Schmidt](/disciplinas/topal2015/gram_schmidt_slides.pdf)

# Bibliografia

  - K. Hoffman e R. Kunze, _Álgebra Linear_. S. Paulo, Ed. Univ.
    de S. Paulo e Polígono, 1970.
  - P. Pulino, _Álgebra linear e suas aplicações: notas de aula_,
    [www.ime.unicamp.br/~pulino/ALESA](http://www.ime.unicamp.br/~pulino/ALESA).
  - H. P. Bueno, _Álgebra linear. Um segundo curso_. Coleção textos
    universitários, Sociedade Brasileira de Matemática, Rio de Janeiro, 2006.
  - A. Kirilov, _Notas de aula de tópicos de álgebra linear de 2012_,
    [people.ufpr.br/~akirilov/ensino/2012/algebralinear.html](http://people.ufpr.br/~akirilov/ensino/2012/algebralinear.html).
  - S. Roman, _Advanced linear algebra_, 2nd edition, Graduate texts in
    mathematics, Springer, 2005.
  - E. Kreyszig, _Introductory functional analysis with applications_,
    John Wiley and Sons, 1978.
  - G. H. Golub and C. F. Van Loan, _Matrix Computations_, The Johns Hopkins
    University Press, London, 3rd edition, 1996
  - R. L. Burden and J. D. Faires, _Numerical Analysis_, Brooks/Cole,
    7th edition, 2001.
  - M. A. Gomes Ruggiero e V. L. da Rocha Lopes. _Cálculo Numérico - Aspectos
    Teóricos e Computacionais_, 2a edição, Editora Pearson, 1997
