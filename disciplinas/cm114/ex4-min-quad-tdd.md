---
layout: disciplina
title: Testes unitários para minimização de quadráticas num intervalo
---

Considere o problema

$$ \min\ f(x) = ax^2 + bx + c \qquad \ell \leq x \leq u. $$

Utilizando o seu conhecimento de Cálculo I, é possível determinar o mínimo
global dessa função nesse intervalo.
Seu objetivo neste exercício, no entanto, **não** é fazer isso.
Você deve **criar testes unitários** para alguém tentando realizar esta tarefa.

A função a ser implementada é
`x = minquadlu(a, b, c, l, u)`.

- Você deve usar a biblioteca `FactCheck`;
- Você precisa ter os testes básicos;
- Você deve testar todos os casos;
- Você deve se preocupar com os possíveis problemas;
- Você deve ter alguns testes aleatórios.
