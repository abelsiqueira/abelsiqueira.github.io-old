---
layout: disciplina
title: Projeto 1 - Um método para minimização com restrições de igualdade
---

Vocês devem implementar um método para minimização com restrições de igualdade:

$$ \min f(x) \qquad \mbox{suj. a} \qquad c(x) = 0. $$

Esse método deve ser rodado em todos os problemas do CUTEst dessa categoria, e
será comparado a algum(ns) outro(s) método(s) do mesmo tipo.
Seu algoritmo deve ser razoavelmente competitivo, no sentido de não "perder de
lavada".

## Pontos importantes:

- A implementação deve ser em Julia;
- O método deve receber um objeto do tipo `AbstractNLPModel`, definido em
[NLPModels.jl](https://github.com/JuliaSmoothOptimizers/NLPModels.jl), que
inclui também os problemas do
[CUTEst.jl](https://github.com/JuliaSmoothOptimizers/CUTEst.jl);
- O método deve ter embasamento teórico, para isso recomendo olhar as
  referências da página (Ribeiro e Karas, Nocedal e Wright, e Luenberger e Ye).
  Alguns artigos também podem ser úteis, dependendo da área;
- Além da implementação simples do método, você deve se preocupar com a
  robustez do mesmo. Para isso, existem técnicas que você pode empregar
  melhorando o seu método. Correção de Segunda Ordem é uma delas. Existem
  outras.
- Seu algoritmo deve usar Busca Linear (não Região de Confiança). Não se
  preocupe, ele será comparado com um Busca Linear também.
- Parâmetros opcionais, como tolerância, máximo de tempo, de iterações, e o que
  for pertinente ao método (como $$\alpha$$ de Armijo).
- Parâmetro opcional `verbose` que controla a impressão de uma tabela com
  informações de iteração, valor de função, valor de otimalidade, etc.

## Cronograma de Entrega:

- 14/Set (Qua) Apresentação oral (15m) de bibliografia inicial (quem vai buscar pelo quê?)
- 26/Set (Seg) Apresentação oral (30m) do resultado da leitura bibliográfica (leram o quê?
  Tiraram o que daí?)
- 28/Set (Qua) Apresentação do cronograma de implementação (10m) (quem vai implementar o quê?)
- Mesmo dia. Apresentação dos testes unitários (15m).
- 03/Out (Seg) Dia de ajustes. (Os problemas que estão tendo)
- 05/Out (Qua) Dia de rodar testes. (Como faz pra rodar tantos testes)
- 10/Out (Seg) Apresentação Final (Até 1h30m)

## Apresentação Final

A apresentação final deve conter

- Slides feitos em Beamer (LaTeX);
- Relatório escrito (em LaTeX) com as decisões, bibliografia, especificações,
  resultados, comparações, e o que mais for pertinente. Não precisa desenvolver a teoria.
  Não precisa colar o código. Precisa das imagens de performance profile.
- Exemplo de execução do código.
- Justificativa dos resultados, i.e., onde tá bom/ruim, porque tá bom/ruim, como
  pode ficar melhor/bom. (i.e., me convencer que o trabalho foi bem feito)
- Apresentação do que cada bibliografia contribuiu;
- Apresentação do que cada pessoa fez;
- Justificativa de porque decidiram as decisões que decidiram (? Porque usar
  Filtro no lugar de Mérito, ou vice-versa, ou outro.)

## Recomendações

As recomendações abaixo facilitam sua vida a médio prazo, mas a curto prazo dão
mais trabalho. (Lembrem-se que existe o segundo projeto. Pode valer a pena o
investimento.)

- Usem o pacote
  [Optimize.jl](https://github.com/JuliaSmoothOptimizers/Optimize.jl),
  que foi feito para desenvolver algoritmos. Ele já conta com alguns algoritmos
  implementados, e mais importante, dá pra ver como alguém mais experiente
  programa (Dominique Orban, no caso);
- Aprendam Git+GitHub;
- Usem um editor descente;
- Anotem tudo que estiverem fazendo, porque vocês vão ter que refazer depois no
  segundo projeto;
- Não deixem pra última hora, porque código tem a mania de quebrar quando você
  precisa dele.
