---
layout: disciplina
title: Resolução de sistema Ax = b com LU feito inplace
---

Extrega: 12/Set (Adiado)

Lembre-se que na aula vimos a decomposição LU modificando diretamente $$A$$.
Note que a única coisa criada a mais foi o vetor $$P$$, com os índices trocados.
Agora, essa matriz LU desse ser utilizável ainda para multiplicações por vetores
e resolução de sistemas.

- Implemente a multiplicação de $$A$$ por um vetor $$x$$ quando $$A$$ estiver na forma
  $$LU$$ compacta.
  - Sua função deve se chamar `lu_mult(A, P, x)`.
  - Você deve **substituir** o conteúdo de $$x$$, sem criar **nenhum** vetor a
    mais.
- Implemente a resolução do sistema $$Ax = b$$ recebendo a matriz $$A$$ na forma LU
  compacta, o vetor P dos índices da permutação, e o vetor $$b$$.
  - Sua função deve se chamar `solve_lu(A, P, b)`,
    e deve substituir `b` por `x`.
- Implemente essas funções num arquivo `lu_inplace.jl`.
- Baixe [este arquivo](teste_lu_inplace.jl) para testar seu código.
