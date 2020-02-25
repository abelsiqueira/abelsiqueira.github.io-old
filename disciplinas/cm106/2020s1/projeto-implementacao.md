---
layout: disciplina
parent: cm106-2020s1
---

# Projeto de implementação de métodos de otimização

Seu grupo irá implementar um método de otimização e fazer testes computacionais usando a biblioteca JuliaSmoothOptimizers.

- Grupos de até 3 pessoas
- A implementação deve ser em Julia usando o framework de desenvolvimento JuliaSmoothOptimizers
- O método deve ser para minimização de uma função não-linear com restrições lineares de igualdade e desigualdade, e limitação nas variáveis
- Vocês devem escrever um relatório (5 a 10 páginas, sem capa) e apresentar o projeto com slides
- No relatório deve constar uma comparação contra um método simples implementado pelo professor perto do deadline
- No relatório deve constar uma comparação contra o método IPOPT, já disponível através do pacote `NLPModelsIpopt.jl`
- Seu método deve aceitar e usar os seguintes critérios de parada como `keyword`:
  - `max_eval`: O número máximo de avaliações das funções (acessado por `sum_counters(nlp)`)
  - `max_time`: O tempo máximo (usando `start_time = time()` e `Δt = time() - start_time`)
- Seu método deve encontrar um valor suficientemente factível:
  - `bℓ - ϵ ≤ x    ≤ bu + ϵ` com `ϵ = 1e-8`
  - `cℓ - ϵ ≤ c(x) ≤ cu + ϵ` com `ϵ = 1e-8`
  - Ou seja, se a restrição é `x ≥ 0`, então `-1e-8` é aceitável
- Seu método deve encontrar um ponto crítico de primeira ordem, dentro de uma tolerância
- Seu método deve usar o perfil de desempenho para comparação, além do que mais você achar interessante
- Para resolução de sistemas lineares simétricos de maneira mais eficiente, você pode usar o pacote [HSL](https://github.com/JuliaSmoothOptimizers/HSL.jl), com uma licença acadêmica
- Os métodos serão comparados avaliando que se encontram de fato perto o suficiente da solução e da factibilidade
- Os métodos serão comparados entre si, e avaliados em vários quesitos. Os seguintes "prêmios" serão dados:
  - 0.2 a mais na média para o método mais rápido (avaliado pelo perfil de desempenho)
  - 0.2 a mais na média para o método com menos avaliações de função (avaliado pelo perfil de desempenho)
  - 0.2 a mais na média para o método mais robusto (avaliado pelo perfil de desempenho)
- A comparação entre os métodos submetidos será feita em problemas do [CUTEst](https://github.com/JuliaSmoothOptimizers/CUTEst.jl), e em problemas em outros formatos também.

O método deve ser submetido como um **pacote em Julia**, de modo que o professor possa adicioná-lo usando
```julia
pkg> add https://github.com/SeuUsuario/SeuMetodo.jl
julia> using SeuMetodo
julia> metodos = Dict(:ipopt => Ipopt, :seu_metodo => seu_metodo)
```
