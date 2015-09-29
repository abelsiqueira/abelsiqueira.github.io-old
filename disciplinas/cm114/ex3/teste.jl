# BFGS

#= Você deve criar um arquivo chamado bfgs.jl e implementar duas funções:
  - A função `bfgs_update!` recebe uma matriz B, um vetor s e um vetor y,
    e atualiza a matriz B com a atualização de BFGS, onde
    s = xᵏ⁺¹-xᵏ e y = ∇f(xᵏ⁺¹)-∇f(xᵏ).
    Lembre-se que a atualização é dada por
      Bₖ₊₁ = Bₖ - \frac{BₖsₖsₖᵀBₖ}{sₖᵀBₖsₖ} + \frac{yₖyₖ^T}{yₖ^Tsₖ}
    (http://www.texpaste.com/n/qcar4abq)
    e que, nesse caso, B é a matriz do SL:

      Bₖdᵏ = -∇f(xᵏ)
````
function bfgs_update!(B, d, y)
  # Implementação
  # Não precisa retornar nada
end
````
  - A função `bfgs_method` que recebe f, ∇f, x0, e opcionalmente (por keyword)
    tol, max_iter e max_time, e implemente o método de BFGS, a partir da matriz
    B₀ = I, usando a atualização implementada por você e com busca linear usando
    o critério de Wolfe com backtracking (usando t = 1, e multiplicando t por
    0.9). Lembre-se que o critério de Wolfe é

      f(xᵏ+tₖdᵏ) ≦ f(xᵏ) + c₁*tₖ*∇f(xᵏ)ᵀdᵏ
      ∇f(xᵏ+tₖdᵏ)ᵀdᵏ ≧ c₂*∇f(xᵏ)ᵀdᵏ

    Use c₁ = 1e-4 e c₂ = 0.9.

    Retorne a solução encontrada (x), o valor da função na solução (fx), o valor
    do gradiente na solução (∇fx), uma variável indicando a saída do algoritmo
    (exit_flag), o número de iterações (iter) e o tempo gasto pelo método
    (el_time). exit_flag deve seguir a lista:
      0 - O método convergiu (|∇f(x)| < tol)
      1 - O método ultrapassou o número máximo de iterações (iter >= max_iter)
      2 - O método ultrapassou o tempo máximo permitido (el_time >= max_time)
````
function bfgs_method(f, ∇f, x0; tol = 1e-5, max_iter = 1000, max_time = 60)
  # Implementação
  return x, fx, ∇fx, exit_flag, iter, el_time
end
````

IMPORTANTE:
  - Seja eficiente na sua implementação. Não crie matrizes desnecessárias. Não
    faça avaliações de função desnecessárias.
  - As matrizes de BFGS são sempre definidas positivas, então use Cholesky (ou
    LDLᵀ) para resolver o sistema linear.
  - Preste bastante atenção à função `bfgs_update`, ela deve modificar a matriz
    B recebida. Faça testes para verificar que ela está funcionando antes de
    testar o método.
=#

using Base.Test

include("bfgs.jl")

macro verbose(msg)
  quote
    if verbose
      println($msg)
    end
  end
end

macro green(msg)
  quote
    println("\033[0;32m$($(msg))\033[m")
  end
end

function teste(;verbose = false)
  T = 10
  ϵ = 1e-5
  max_iter = 1000
  max_time = 60

  f(x) = dot(x-1,x-1)/2
  ∇f(x) = x-1
  for n = [2 10 100 1000]
    @green("Rodando problema simples de tamanho $n")
    x, fx, ∇fx, ef, iter, el_time = bfgs_method(f, ∇f, rand(n), tol=ϵ, max_iter=max_iter,
        max_time=max_time)
    e = ones(n)
    @test norm(x-e) < ϵ
    @test norm(fx) < ϵ^2/2
    @test norm(∇fx) < ϵ
    @test iter == 1
    @test ef == 0
  end

  for n = [2 5 10 20 30 50 100 200 400]
    @green("Rodando problema quadrático de tamanho $n")
    A = rand(n,n)
    (G,R) = qr(A)
    Q = G*diagm(linspace(1,100,n))*G'
    g = rand(n)
    f(x) = 0.5*dot(x,Q*x) + dot(g,x)
    ∇f(x) = Q*x + g
    x, fx, ∇fx, ef, iter, el_time = bfgs_method(f, ∇f, rand(n), tol=ϵ, max_iter=max_iter,
        max_time=max_time)
    @verbose("‖∇fx‖ = $(norm(∇fx))")
    @verbose("iter = $iter")
    @verbose("ef = $ef")
    @test norm(∇fx) < ϵ
  end

  for n = 4:2:10
    @green("Rodando com f(x) = ∑xᵢ^$n")
    f(x) = sum(x.^n)/n
    ∇f(x) = x.^(n-1)
    x₀ = linspace(1,n,10)/n
    x, fx, ∇fx, ef, iter, el_time = bfgs_method(f, ∇f, x₀, tol=ϵ, max_iter=max_iter,
      max_time=max_time)
    @verbose("‖∇fx‖ = $(norm(∇fx))")
    @verbose("iter = $iter")
    @verbose("ef = $ef")
    @test norm(∇fx) < ϵ
  end

  for n = [2 10 20 40 100 200 400]
    @green("Rodando Rosenbrock de tamanho $n")
    function f(x)
      n = length(x)
      fx = 0.0
      for i = 1:2:n
        fx += (1-x[i])^2 + 100*(x[i+1]-x[i]^2)^2
      end
      return fx
    end
    function ∇f(x)
      n = length(x)
      gx = zeros(n)
      for i = 1:2:n
        gx[i]   = -2*(1-x[i]) - 400*x[i]*(x[i+1]-x[i]^2)
        gx[i+1] = 200*(x[i+1]-x[i]^2)
      end
      return gx
    end
    x₀ = [1.2;-0.8;zeros(n-2)]
    x, fx, ∇fx, ef, iter, el_time = bfgs_method(f, ∇f, x₀, tol=ϵ, max_iter=max_iter,
      max_time=max_time)
    @verbose("‖∇fx‖ = $(norm(∇fx))")
    @verbose("iter = $iter")
    @verbose("ef = $ef")
    @test norm(∇fx) < ϵ
  end

  for n = [2 5 10 50 100]
    @green("Testando bfgs_update! com n = $n")
    A = rand(n,n)
    (G,R) = qr(A)
    Q = G*diagm(linspace(1,100,n))*G'
    s = rand(n)
    y = rand(n)
    C = Q - Q*s*s'*Q'/dot(s,Q*s) + y*y'/dot(y,s)
    bfgs_update!(Q, s, y)
    @test norm(Q-C) < ϵ
  end
end

@time teste(verbose=true)
