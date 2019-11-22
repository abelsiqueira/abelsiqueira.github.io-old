# Decomposição LDLᵀ
# Entrega: 19 de Ago: 18h00

#= Você deve criar um arquivo chamado ldlt.jl e implementar duas funções:
  - A função `ldlt` recebe uma matriz A e retorna uma matriz L triangular
  inferior com diagonal unitária e um vetor D que formam a decomposição LDLᵀ (o
  vetor D é a diagonal da matriz diagonal).
````
function ldlt(A)
  # Implementação
  return L, D
end
````
  Para testar, verifique que `norm(L*diagm(D)*L'-A)` é suficientemente pequeno.
  Para criar a matriz A para testar o seu código, lembre-se que A precisa ser
  simétrica. Teste inicialmente com matrizes definidas positivas, pois não
  existe chance de falha do algoritmo nesse caso. Para criar uma matriz
  garantidamente definida positiva, faça
````
A = rand(10,10);
A = A*A' + eye(10);
````
  Você pode, inclusive, provar que a matriz obtida será definida positiva.

  - A função `solve_ldlt` que recebe L, D e b e resolve o sistema Ax = b, onde A
  está representada pela matriz L e o vetor D (saídas da função acima) que
  formam a decomposição LDLᵀ.
````
function solve_ldlt(L, D, b)
  # Implementação
  return x
end
````
  Para testar, verifique que `norm(x-A\b)` é suficientemente pequeno.
  Importante, não use mais que o necessário nessa implementação. Por exemplo,
  não é precisa criar nenhum vetor além do vetor x se saída, e nenhuma matriz a
  mais.
=#

using Base.Test
#using TimeIt

include("ldlt.jl")

macro verbose(msg)
  quote
    if verbose
      println($msg)
    end
  end
end

function teste(;verbose = false)
  T = 10
  ϵ = 1e-12

  for n in [5 10 25 50 100 500]
    e = ones(n)

    for t = 1:T
      A = rand(n,n)
      A = A*A' + eye(n)
      L, D = ldlt(A)
      @test norm(A - L*diagm(D)*L') < ϵ*cond(A)
      b = A*e
      x = solve_ldlt(L, D, b)
      @test norm(x-e) < ϵ*cond(A)*norm(b)*n
    end

    for t = 1:T
      A = rand(n,n)
      A = A+A'
      L, D = ldlt(A)
      @test norm(A - L*diagm(D)*L') < ϵ*cond(A)*maximum(abs(D))
      b = A*e
      x = solve_ldlt(L, D, b)
      @verbose("κ(A) = $(cond(A))")
      @verbose("norm(b) = $(norm(b))")
      @verbose("min(|b|) = $(minimum(abs(b)))")
      @test norm(x-e) < ϵ*cond(A)*norm(b)*n
    end

  end
end

#@timeit teste()
#@time teste()
@time teste()
