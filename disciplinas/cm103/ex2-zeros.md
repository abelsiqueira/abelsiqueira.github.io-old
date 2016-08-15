---
layout: post
title: Zeros de função
---

- Construa um exemplo onde o método de falsa posição é **muito** pior, em
  iterações, que o método da bissecção. (Tirando a precisão do computador, é
  possível montar um que demora o quanto quisermos.)
- O exercício atual serve para mostrar como o método de Newton depende do ponto
  inicial.
  A função $$f(x) = x^3-x$$ tem três raízes reis distintas: 0, -1 e 1.
  Dependendo do ponto inicial, o método de Newton irá convergir para pontos
  diferentes.

  - Faça o plot dessa função no intervalo $$[-2,2]$$.
  - Faça um código que dado $$x$$, plota $$f$$ e a curva tangente à $$f$$ no ponto
    $$x$$.
  - Faça um código que dado $$x$$, plota $$f$$, a curva tangente em $$x$$, o novo
    ponto encontrado por Newton, e a curva tangente no novo ponto encontrado.
  - Escolha uma grande quantidade de pontos entre $$-1.2$$ e $$1.2$$ e faça o método de
    Newton a partir de cada ponto escolhido.
    Caso o método convirja para $$1$$, pinte o ponto de vermelho. Caso convirja
    para $$-1$$, pinte o ponto de azul. Caso convirja para $$0$$, pinte o ponto
    de branco. Caso não convirja, pinte de preto.
  - Existe um ponto $$a$$ tal que se $$|x_0| < a$$, então
  a sequência gerada pelo Método de Newton converge para
  $$0$$. Que ponto é esse? (Dica, para o ponto $$x_0 = a$$, o método irá entrar em loop
  infinito, por algum motivo.
  - Existe um ponto $$b$$ tal que se $$|x_0| > b$$, então a sequência gerada pelo
    Método de Newton converge para $$\pm 1$$, de acordo com o sinal de $$b$$. Qual
    você acha que é esse $$b$$?
  - Considere os pontos do tipo $$a + \lambda (b-a)$$.
    Começando em $$\lambda = 1$$ e fazendo
    $$\lambda = 0.9\lambda$$,
    rode Newton para o ponto dado por $$\lambda$$.
    Caso o método convirja para $$1$$, pinte o ponto de vermelho. Caso convirja
    para $$-1$$, pinte o ponto de azul. Caso não convirja, pinte de preto.
    No entanto, no gráfico, faça plote $$(-\log(\lambda), \pm 1)$$ para
    facilitar a visualização.
