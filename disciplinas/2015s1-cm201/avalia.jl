# Avalia o código do aluno.
# Adicione este arquivo à mesma pasta onde está o código,
# e rode `include("avalia.jl")` a partir do Julia, ou
# `julia avalia.jl`, se estiver no terminal.
using Base.Test
include("newton.jl")

msg(m) = println("\033[0;33m$m\033[0m")
passed(m)  = println("\033[0;32m$m\033[0m")
passed() = passed("Passou")

test_handler(r::Test.Success) = nothing
test_handler(r::Test.Failure) = error("Teste falhou: $(r.expr):\n$(r.resultexpr)")
test_handler(r::Test.Error)   = rethrow(r)

eps = 1e-6
kmax = 10000

Test.with_handler(test_handler) do

  msg("Testando funções lineares - solução trivial em 1 iteração")
  for i = 1:100
    a = rand()*2-1
    b = rand()*2-1
    x, fx, k, ef = newton(x->a*x+b, x->a, 0)
    @test k == 1
    @test abs(x+b/a) < eps
    @test abs(fx) < eps
  end
  passed()

  msg("Testando funções quadráticas")
  msg(" - Com duas soluções")
  for i = 1:100
    a = rand() + 1
    r = rand()*2-1
    d = rand() + 1
    s = randbool() ? 1 : -1
    f(x) = s*( a^2*(x-r)^2 - d^2 )
    fd(x) = s*( 2*a^2*(x-r) )
    x, fx, k, ef = newton(f, fd, r + 2*d)
    @test abs(x-r-d/a) < eps
    @test abs(fx) < eps
    x, fx, k, ef = newton(f, fd, r - 2*d)
    @test abs(x-r+d/a) < eps
    @test abs(fx) < eps
  end
  passed()
  msg(" - Com solução única")
  for i = 1:100
    a = rand() + 1
    r = rand()*2-1
    s = randbool() ? 1 : -1
    x0 = r + s*(1+rand())
    s = randbool() ? 1 : -1
    f(x) = s*( a^2*(x-r)^2 )
    fd(x) = s*( 2*a^2*(x-r) )
    x, fx, k, ef = newton(f, fd, x0)
    @test abs(x-r) < 1e-2
    @test abs(fx) < eps
  end
  passed()
  msg(" - Sem solução ")
  for i = 1:10
    a = rand() + 1
    r = rand()*2 - 1
    d = rand() + 1
    s = randbool() ? 1 : -1
    x0 = r + s*(1+rand())
    s = randbool() ? 1 : -1
    f(x) = s*( a^2*(x-r)^2 + d^2)
    fd(x) = s*( 2*a^2*(x-r) )
    x, fx, k, ef = newton(f, fd, x0)
    @test ef != 0
    @test k in [kmax,kmax+1]
    @test abs(fx) >= d^2
  end
  passed()
  msg("Testando f(x) = x^3")
  x, fx, k, ef = newton(x->x^3, x->3*x^2, 1)
  @test ef == 0
  @test k <= 13
  @test abs(fx) < 1e-6
  passed()
  msg("Testando f(x) = sqrt(abs(x))")
  for i = 1:100
    x0 = rand()*100
    x, fx, k, ef = newton(x->sqrt(abs(x)), x->x/(2*sqrt(abs(x))*abs(x)), x0)
    @test ef != 0
    @test k in [kmax,kmax+1]
    @test abs(abs(x)-abs(x0)) < 1e-8
  end
  passed()
  msg("Testando f(x) = x^2-1 com x0 = 0")
  x, fx, k, ef = newton(x->x^2-1, x->2*x, 0)
  @test ef != 0
  @test k in [0,1]
  @test abs(x) < 1e-12
  @test abs(fx+1) < 1e-12
  passed()
  msg("Testando f(x) = x^2 com x0 = 0")
  x, fx, k, ef = newton(x->x^2, x->2*x, 0)
  @test ef == 0
  @test k in [0,1]
  @test abs(x) < 1e-12
  @test abs(fx) < 1e-12
  passed()
end

