# Moré-Sorensen BFGS

#= Nosso objetivo agora é implementar BFGS com região de confiança,
usando região de confiança resolvido por Moré-Sorensen.

- Você deve usar a função `more_sorensen` que fizemos em aula e atualizá-la
para que a busca por λ pare se
  |norm(d)-λ| < tol ou λhigh-λlow < tol.

- Você deve atualizar a implementação de `bfgs_trust` para que não faça nada
caso yᵀs ≦ 0. Isso para garantir que B seja definida positiva.

- Você deve implementar a função `bfgs_trust` que recebe f, ∇f, x0, e
opcionalmente (por keyword) tol, max_iter e max_time, e implemente o método de
BFGS, a partir da matriz B₀ = I, usando a atualização `bfgs_update!`
implementada no exercício anterior por você e a estratégia de região de
confiança com resolução através do método de Moré-Sorensen.
Use Δ₀ = norm(∇f(x₀)).
Use eta1 = 0.25, eta2 = 0.75, sigma1 = 0.25 e sigma2 = 2.0.

Retorne a solução encontrada (x), o valor da função na solução (fx), o valor
do gradiente na solução (∇fx), uma variável indicando a saída do algoritmo
(exit_flag), o número de iterações (iter) e o tempo gasto pelo método
(el_time). exit_flag deve seguir a lista:
  0 - O método convergiu (|∇f(x)| < tol)
  1 - O método ultrapassou o número máximo de iterações (iter >= max_iter)
  2 - O método ultrapassou o tempo máximo permitido (el_time >= max_time)

````
function bfgs_trust(f, ∇f, x0; tol = 1e-5, max_iter = 1000, max_time = 60)
  # Implementação
  return x, fx, ∇fx, exit_flag, iter, el_time
end
````

Avaliação:
  - [6.5] Passar em todos os testes
  - [0.5] Identação correta (use TABS ou espaços, não ambos)
  - [1.5] Atualização da região, de x e de BFGS corretamente.
  - [1.5] Calcular f, ∇f, matrizes e produtos internos só quando necessário.
=#

using Base.Test

include("bfgs_trust.jl")

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
    x, fx, ∇fx, ef, iter, el_time = bfgs_trust(f, ∇f, rand(n), tol=ϵ, max_iter=max_iter,
        max_time=max_time)
    e = ones(n)
    @test norm(x-e) < ϵ
    @test norm(fx) < ϵ^2/2
    @test norm(∇fx) < ϵ
    @test ef == 0
  end

  for n = [2 5 10 20 30 50 100 200]
    @green("Rodando problema quadrático de tamanho $n")
    A = rand(n,n)
    (G,R) = qr(A)
    Q = G*diagm(linspace(1,100,n))*G'
    g = rand(n)
    f(x) = 0.5*dot(x,Q*x) + dot(g,x)
    ∇f(x) = Q*x + g
    x, fx, ∇fx, ef, iter, el_time = bfgs_trust(f, ∇f, rand(n), tol=ϵ, max_iter=max_iter,
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
    x, fx, ∇fx, ef, iter, el_time = bfgs_trust(f, ∇f, x₀, tol=ϵ, max_iter=max_iter,
      max_time=max_time)
    @verbose("‖∇fx‖ = $(norm(∇fx))")
    @verbose("iter = $iter")
    @verbose("ef = $ef")
    @test norm(∇fx) < ϵ
  end

  for n = [2 10 20 40 100 200]
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
    x, fx, ∇fx, ef, iter, el_time = bfgs_trust(f, ∇f, x₀, tol=ϵ, max_iter=max_iter,
      max_time=max_time)
    @verbose("‖∇fx‖ = $(norm(∇fx))")
    @verbose("iter = $iter")
    @verbose("ef = $ef")
    @test norm(∇fx) < ϵ
  end

  begin # Problema DENSCHNA do CUTEst
    @green("Rodando DENSCHNA")
    f(x) = x[1]^4 + (x[1]+x[2])^2 + (-1.0+exp(x[2]))^2
    ∇f(x) = [4*x[1]^3 + 2*(x[1]+x[2]);
            2*(x[1]+x[2]) + 2*exp(x[2])*(-1.0+exp(x[2]))]
    x₀ = [1.0;1.0]
    x, fx, ∇fx, ef, iter, el_time = bfgs_trust(f, ∇f, x₀, tol=ϵ,
      max_iter=max_iter, max_time=max_time)
    @verbose("‖∇fx‖ = $(norm(∇fx))")
    @verbose("iter = $iter")
    @verbose("ef = $ef")
    @test norm(∇fx) < ϵ
  end

  begin # Problema DENSCHNB do CUTEst
    @green("Rodando DENSCHNB")
    f(x) = (x[1]-2.0)^2 + ((x[1]-2.0)*x[2])^2 + (x[2]+1.0)^2
    ∇f(x) = [2*(x[1]-2.0) + 2*(x[1]-2.0)*x[2]^2;
            2*(x[1]-2.0)^2*x[2] + 2*(x[2]+1.0)]
    x₀ = [1.0;1.0]
    x, fx, ∇fx, ef, iter, el_time = bfgs_trust(f, ∇f, x₀, tol=ϵ,
      max_iter=max_iter, max_time=max_time)
    @verbose("‖∇fx‖ = $(norm(∇fx))")
    @verbose("iter = $iter")
    @verbose("ef = $ef")
    @test norm(∇fx) < ϵ
  end

  begin # Problema DENSCHNC do CUTEst
    @green("Rodando DENSCHNC")
    f(x) = (-2+x[1]^2+x[2]^2)^2 + (-2+exp(x[1]-1)+x[2]^3)^2
    ∇f(x) = [2*x[1]*(-2+x[1]^2+x[2]^2)+2*exp(x[1]-1)*(-2+exp(x[1]-1)+x[2]^3);
            2*x[2]*(-2+x[1]^2+x[2]^2)+6*x[2]^2*(-2+exp(x[1]-1)+x[2]^3)]
    x₀ = [1.0;2.0]
    x, fx, ∇fx, ef, iter, el_time = bfgs_trust(f, ∇f, x₀, tol=ϵ,
      max_iter=max_iter, max_time=max_time)
    @verbose("‖∇fx‖ = $(norm(∇fx))")
    @verbose("iter = $iter")
    @verbose("ef = $ef")
    @test norm(∇fx) < ϵ
  end

  begin # Problema SINEVAL do CUTEst
    @green("Rodando SINEVAL")
    f(x) = 1e4*(x[2]-sin(x[1]))^2 + x[1]^2/4
    ∇f(x) = [-2e4*cos(x[1])*(x[2]-sin(x[1])) + x[1]/2;
            2e4*(x[2]-sin(x[1]))]
    x₀ = [1.0;4.712389]
    x, fx, ∇fx, ef, iter, el_time = bfgs_trust(f, ∇f, x₀, tol=ϵ,
      max_iter=max_iter, max_time=max_time)
    @verbose("‖∇fx‖ = $(norm(∇fx))")
    @verbose("iter = $iter")
    @verbose("ef = $ef")
    @test norm(∇fx) < ϵ
  end

  begin # Problema que falha nas iterações
    @green("Problema que falha nas iterações")
    f(x) = sum(x.^10)/10
    ∇f(x) = x.^9
    x₀ = [1.0;1.0]
    x, fx, ∇fx, ef, iter, el_time = bfgs_trust(f, ∇f, x₀, tol=ϵ,
      max_iter=1, max_time=max_time)
    @verbose("‖∇fx‖ = $(norm(∇fx))")
    @verbose("iter = $iter")
    @verbose("ef = $ef")
    @test ef == 1
    @test iter >= 1
  end

  begin # Problema que falha no tempo
    @green("Problema que falha no tempo")
    f(x) = dot(x,x)/2
    ∇f(x) = -x
    x₀ = [1.0;1.0]
    x, fx, ∇fx, ef, iter, el_time = bfgs_trust(f, ∇f, x₀, tol=ϵ,
      max_iter=max_iter, max_time=0.1)
    @verbose("‖∇fx‖ = $(norm(∇fx))")
    @verbose("iter = $iter")
    @verbose("ef = $ef")
    @test ef == 2
    @test el_time >= 0.1
  end
end

@time teste(verbose=true)
