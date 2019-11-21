---
layout: disciplina
title: Implementação de métodos de região de confiança
---

*Entrega: 07/Novembro*

O objetivo do projeto é implementar um método com região de confiança, usando as
maneiras de resolver o subproblema que vimos em sala.

Temos 3 maneiras para resolver o subproblema:
- Moré-Sorensen,
- Dogleg,
- Steihaug-CG

Cada aluno deve implementar um método diferente para o subproblema.

As implementações devem ser comparadas posteriormente, usandos os critérios:
- Tempo
- Número de avaliações de funções
- Número de multiplicações Matriz-Vetor

Seu algoritmo de região de confiança deve seguir o padrão

````julia
function nome_do_seu_metodo(nlp; maxiter = 10_000, maxtime = 30,
    eta1 = 1e-2, eta2 = 0.66, sigma1 = 1.2, sigma2 = 0.25)
  ...
  return x, fx, ngx, iter, el_time
end
````

**Compare os valores da função objetivo!**
