---
layout: post
title: Minimização em uma variável
---

Implemente os métodos de busca em uma variável com

  - Busca por interpolação quadrática;
  - Busca por seção áurea.

A grande diferença do que já foi feito em sala é que você deve
começar em um ponto $$x_0$$, ao invés de um intervalo. Não existe
garantia de que a função tem minimizar, muito menos alguma
hipótese sobre esse minimizador.
Você pode assumir que a função é contínua.

  - Caso a função tenha algum minimizador para $$|x| < 10^6$$, você
deve encontrar este minimizador.
  - **Não** inicie seu algoritmo com
esse intervalo.
  - Adicione condições de parada para o tempo e o número de **avaliações
de função**.
  - Faça testes diversos e avalie vários casos.

Código de teste para o problema acima:
[min1d_test]({{ site.baseurl }}/disciplinas/cm114/min1d_test.jl).
Preste atenção aos nomes dos arquivos e das funções.
