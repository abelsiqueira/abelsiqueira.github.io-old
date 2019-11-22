---
layout: disciplina
title: Implementação de Testes para o OptimizationProblems.jl
---

*Entrega: 03/Outubro*

Para desenvolver o projeto, vocês utilizarão testes computacionais.
Alguns desses testes serão obtidos usando o pacote
[OptimizationProblems.jl](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl).

A tarefa desta semana é implementar 20 problemas para esse pacote.
Como o método de vocês é para otimização com restrições de igualdade, vocês
precisam encontrar alguns problemas de igualdade, mas também não podem esquecer
que o método de vocês deve conseguir resolver problemas sem restrições, já que é
um caso particular.

Veja [este issue](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/issues/7).
Ali, algumas referências são sugeridas. A tarefa de vocês todos, como um grupo,
é

  - Implementar 5 exercícios de Luksan e Vlcek;
  - Implementar 5 exercícios de Moré-Garbow-Hillstrom;
  - Implementar 5 exercícios com restrições apenas de igualdade de
    Hock-Schittkowski;
  - Implementar 5 exercícios com restrições apenas de igualdade de
    algum outro lugar, que você deve buscar (deve ter referência, e ser útil,
    não qualquer problema de duas variáveis);
  - Usar [NLPModels.jl](https://github.com/JuliaSmoothOptimizers/NLPModels.jl)
    para comparar com o problema homônimo do CUTEst (quando houver). Se houver
    disparidade **que não seja um erro seu**, explicar o porque;
  - Usar o git para commitar e fazer um Pull-Request no GitHub (O código deve
    estar limpo e bonito. Veja os outros exemplo no site);
