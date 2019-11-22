---
layout: disciplina
title: Efeito Maratos e Correção de Segunda Ordem
---

O capítulo 15.5 do livro Numerical Optimization, 2ed, de Nocedal e Wright,
descreve o chamado efeito Maratos, onde uma direção que seria, em teoria,
ótima, não é aceita pelo critério da função de Mérito ou pelo Filtro.
No livro, o exemplo dado é

$$ \min\ f(x) = 2(x_1^2 + x_2^2 - 1) - x_1 \qquad \mbox{suj. a} \qquad x_1^2 + x_2^2 = 1, $$

a partir do ponto $$x_0 = (\cos\theta, \sin\theta)^T$$ e andando na direção

$$ p = \left(\begin{array}{cc} \sin^2\theta \\ -\sin\theta\cos\theta \end{array}\right). $$

É fácil mostrar que $$f(x_0+p) > f(x_0)$$ e que $$\left\vert c(x_0+p)\right\vert
> \left\vert c(x_0)\right\vert.$$

- Faça um gráfico mostrando as curvas de nível de $$f$$, a restrição $$c$$, o ponto
   $$x_0$$ e o ponto $$x_0+p$$ (para algum $$\theta > 0$$).

Uma alternativa para evitar o efeito Maratos é a **Correção de Segunda Ordem**,
(SOC, do inglês Second Order Correction),
descrita no capítulo 15.6 do mesmo livro.

- Atualize um dos métodos para restrições discutidos em sala incluindo uma
correção de segunda ordem. A atualização deve ser feita apenas em algumas
condições, que você deve investigar.
- Compare a implementação nova com a antiga, e encontre problemas onde o métodos
  sem SOC vai melhor que o método com SOC, e um que é o contrário.
