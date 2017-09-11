---
layout: post
title: Exercícios Básicos
---

Estes exercícios são de nível introdutório, para o aluno verificar que sabe o
suficiente de Julia. Note que eles são do nível das disciplinas básicas de
programação, e ainda não exigem nenhum conhecimento específico de cálculo
numérico.

- Implemente funções que calulam a norma 1 e a norma infinito de vetores e de
  matrizes. São 4 funções distintas. Não use os comandos `norm` ou similares.
- Implemente uma função que calcula o n-ésimo termo da progressão de Fibonacci:
  $$F_1 = F_2 = 1$$ e $$F_{n+2} = F_{n+1} + F_n$$.

  Teste com $$ F_{40} =  102334155 $$. Teste também com
  $$ F_{400} $$ que é da ordem de $$10^{83}$$. Para fazer com 400, use `BigInt(400)`
  como entrada do seu programa.
- Faça a função que calcula a sequência de Collatz de um número. Dado um número
  $$x$$ a sequência de Collatz desse número começa com $$a_1 = x$$ e é atualizada
  por $$a_{n+1} = a_n/2$$ se $$a_n$$ for par ou $$a_{n+1} = 3a_n + 1$$ se $$a_n$$ for
  ímpar. Quando $$a_n = 1$$ a sequência para.
  Por exemplo, a sequência de Collatz do 3 é `3, 10, 5, 16, 8, 4, 2, 1`.
- Faça a função `extrema_quad(a, b, c, l, u)` que cálcula o mínimo e o máximo
  globais da função $$ f(x) = ax^2 + bx + c $$ no intervalo real $$[\ell,u]$$.
  Essa função deve retornar `min, max, fmin, fmax` como saída.
  Atente-se ao caso em que $$a$$ é zero.
