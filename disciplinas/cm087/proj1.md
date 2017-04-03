---
layout: post
---
# Projeto 1

**Entrega e apresentação: 17/Abril**

O objetivo deste projeto é melhorar um outro método por meio de melhorias na
álgebra linear computacional.
Em específico trabalharemos com o Método Simplex.

A entrega consiste em
- Relatório completo e auto-suficiente em LaTeX, com Introdução,
  Desenvolvimento, Testes Computacionais e Conclusões. Pode-se
  colocar outras seções conforme necessário. Deve-se explicitar
  as melhorias propostas e testadas, assim como motivações e
  bibliografias.
- Apresentação com slides.
- Código, disponível online, das melhorias.

Para comparação, considere:
- A implementação do Simplex sem melhorias feita por vocês;
- A implementação do Simplex com melhorias propostas e discutidas, feita por vocês;
- A implementação do Simplex feita no GLPK ou no CLP.

A implementação de vocês deve ser o Simplex primal.

**Obs.:** O Simplex sem melhorias deve usar a matriz $$A$$ esparsa, e resolver o
sistema usando `\` ou `LU`. Cuidado para não piorar este Simplex ao invés de melhorar
o outro.

Para testes, escolha alguma biblioteca de problemas teste.
Uma referência: [Hans Mittelman's Benchmark for Optimization
Software](http://plato.asu.edu/bench.html).

