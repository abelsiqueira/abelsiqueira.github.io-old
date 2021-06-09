# This file was generated, do not modify it.

n = 144
V = 80_000
i = 0.03
p = V*(1+i)^n*i/( (1+i)^n - 1)

n = 48
i = 0.1 / 100
V = 40_000
p = V*(1+i)^n*i/( (1+i)^n - 1)

n = 48
V = 40_000
p = 900
#i = ?

a, b = 1.0, 2.0
f(x) = x^2 - 2

f(a) * f(b)

a, b

x = (a + b) / 2
if f(a) * f(x) < 0
    b = x
else
    a = x
end
a, b

x

f(x)

x^2

function bisseccao(f, a, b; tol = 1e-8)
    fa = f(a)
    x = (a + b) / 2
    fx = f(x)
    while abs(fx) > tol
        x = (a + b) / 2
        fx = f(x)
        if fa * fx < 0
            b = x
        else
            a = x
            fa = fx
        end
    end
    return x, fx
end

bisseccao(x -> x^2 - 2, 1, 2)

bisseccao(x -> x^2 - 2, 1, 2, tol=1e-4)

f(x) = (cos(x) - 0.5)^2
s = pi/3
sn = nextfloat(s)
sn2 = nextfloat(sn)
sp = prevfloat(s)

println("Solução esperada: s = π/3 = $s")
println("f(s) = $(f(s))")
println("Próximo ponto flutuante: sn = $sn")
println("f(sn) = $(f(sn))")
println("Próximo ponto flutuante: sn2 = $sn2")
println("f(sn2) = $(f(sn2))")
println("Ponto flutuante antes de s: sp = $sp")
println("f(sp) = $(f(sp))")

f(x) = 1e50 * (cos(x) - 0.5)^2
s = pi/3
sn = nextfloat(s)
sn2 = nextfloat(sn)
sp = prevfloat(s)

println("Solução esperada: s = π/3 = $s")
println("f(s) = $(f(s))")
println("Próximo ponto flutuante: sn = $sn")
println("f(sn) = $(f(sn))")
println("Próximo ponto flutuante: sn2 = $sn2")
println("f(sn2) = $(f(sn2))")
println("Ponto flutuante antes de s: sp = $sp")
println("f(sp) = $(f(sp))")

f(x) = (cos(pi/3 + 1e-50 * (x - pi/3)) - 0.5)^2
s = pi/3
sn = nextfloat(s)
sn2 = nextfloat(sn)
sp = prevfloat(s)

println("Solução esperada: s = π/3 = $s")
println("f(s) = $(f(s))")
println("Próximo ponto flutuante: sn = $sn")
println("f(sn) = $(f(sn))")
println("Próximo ponto flutuante: sn2 = $sn2")
println("f(sn2) = $(f(sn2))")
println("Ponto flutuante antes de s: sp = $sp")
println("f(sp) = $(f(sp))")

println("x₀ = 0.0, f(x₀) = $(f(0.0))")

"""
    bisseccao(f, a, b; atol=1e-6, rtol=1e-6, maxiter=10_000)

Calcula um zero para `f` no intervalo `[a,b]` utilizando o método da bissecção.
Se `f(a) * f(b) > 0`, então retorna um erro.

Saída: `xₖ, f(xₖ), k`

    xₖ    - aproximação para um zero de f
    f(xₖ) - f aplicada nessa aproximação
    k     - número de iterações
"""
function bisseccao(f::Function, a::Real, b::Real; atol=1e-6, rtol=1e-6, maxiter=10_000)
    (fa, fb) = (f(a), f(b))
    ϵ = atol + rtol * (abs(fa) + abs(fb)) / 2
    if abs(fa) <= ϵ
        return a, fa, 0
    elseif abs(fb) <= ϵ
        return b, fb, 0
    elseif fa * fb > 0
        error("f(a) e f(b) devem ter sinais diferentes")
    end
    x = (a + b) / 2
    fx = f(x)
    iter = 1

    funcionou = abs(fx) ≤ ϵ
    explodiu = iter > maxiter

    #while !(abs(fx) <= ϵ || iter > maxiter)
    while !(funcionou || explodiu)
    #while abs(fx) > ϵ && iter ≤ maxiter

        if fx * fa < 0
            b, fb = x, fx
        else
            a, fa = x, fx
        end

        x = (a + b) / 2
        fx = f(x)
        iter += 1

        funcionou = abs(fx) ≤ ϵ
        explodiu = iter > maxiter
    end

    return x, fx, iter
end

xtil, fx, iter = bisseccao(x->x^2 - 2, 1, 2)

xtil^2

x = sqrt(2)

Erro = x - xtil

ErroAbs = abs(Erro)

ErroRel = ErroAbs/x

xtil, fx, iter = bisseccao(x->x^2 - 2, 1, 2, atol=1e-12, rtol=1e-12)

abs(x-xtil)/x

xtil, fx, iter = bisseccao(x->x^2, -1, 3)

xtil, fx, iter = bisseccao(x->x*exp(x) - 1.0, 0, 1, atol=1e-12, rtol=1e-12)

function equacao_price(i, p, V, n)
    #Implemente
    if i == 0
        return p - V / n
    else
        return p - V * i * (1 + i)^n / ((1 + i)^n - 1)
    end
end

function calc_juros(p, V, n :: Int)
    #Implemente
    if p < 0 || V < 0 || n < 1 || p ≥ V
        error("Não é possível")
    end
    f(i) = equacao_price(i, p, V, n)
    a = -1.0
    b = 1.0
    i, fi, k = bisseccao(f, a, b)
    return i
end

equacao_price(0.0346015, 120, 1000, 10)

calc_juros(120, 1000, 10)

calc_juros(1100, 10_000, 10)

calc_juros(1500, 10_000, 10)

calc_juros(1000, 10_000, 10)

calc_juros(990, 10_000, 10)

calc_juros(-1.0, 10_000, 10)

calc_juros(11000, 10_000, 10)

using Plots
gr(size=(600,400))
f(x) = x^2 - 2
plot(f, 0, 3, c=:blue, lab="f", leg=:topleft)
plot!(x->0, 0, 3, c=:black, lab="")
a = 2.5
scatter!([a], [f(a)], c=:red, lab="x0")
L(x) = f(a) + 2 * a * (x - a)
plot!(L, 0, 3, c=:red, lab="L0")
ylims!(-2, 5)
png(joinpath(@OUTPUT, "fig-zeros1"))

f(x) = x^2 - 2
plot(f, 0, 3, c=:blue, lab="f", leg=:topleft)
plot!(x->0, 0, 3, c=:black, lab="")
a = 2.5
scatter!([a], [f(a)], c=:blue, lab="x0")
a = a - f(a) / 2a
plot!([a; a], [0; f(a)], l=:dash, c=:red, lab="")
scatter!([a], [f(a)], c=:red, lab="x1")
L(x) = f(a) + 2 * a * (x - a)
plot!(L, 0, 3, c=:red, lab="L1")
ylims!(-2, 5)
png(joinpath(@OUTPUT, "fig-zeros2"))

using Printf

"""
    newton(f, fder, x; atol=1e-6, rtol=1e-6, maxiter=10_000, fdertol=1e-12)

Calcula um zero para a função `f` utilizando o método de Newton.
Inicia o método a partir do ponto `x` e usa a função `fder ` como
derivada da função `f`.

Caso a derivada fique muito próxima de zero, um erro é lançado.

Saída: `xₖ, f(xₖ), k`

    xₖ    - aproximação para um zero de f
    f(xₖ) - f aplicada nessa aproximação
    k     - número de iterações
"""
function newton(f, fder, x; atol=1e-6, rtol=1e-6, maxiter=30, fdertol=1e-12)
    fx = f(x)
    iter = 0
    ϵ = atol + rtol * abs(fx)
    while !(abs(fx) <= ϵ || iter > maxiter)
        fderx = fder(x)
        if abs(fderx) < fdertol
            error("Derivada muito próxima de zero")
        end
        @printf("%15.9e  %8.2e\n", x, fx)
        x = x - fx/fderx
        fx = f(x)
        iter += 1
    end
    return x, fx, iter
end

f(x) = x^2 - 2
fder(x) = 2x
x0 = 1
x, fx, iter = newton(f, fder, x0, atol=1e-12, rtol=1e-12)

x, fx, iter = newton(f, fder, 100.0)

x, fx, iter = newton(f, fder, 100.0, rtol=0.0)

x, fx, iter = newton(x->x * exp(x) - 1, x->exp(x) * (1 + x), -1.0)

x, fx, iter = newton(x->x * exp(x) - 1, x->exp(x) * (1 + x), 1.0)

x, fx, iter = newton(x->exp(x), x->exp(x), 1.0)

x, fx, iter = newton(x->x^2 + 1, x->2x, 2.0)

x, fx, iter = newton(x->x^2 + 1e-8, x->2x, 2.0)

a = 1/sqrt(5)
println("1/√5 = $a")
x, fx, iter = newton(x->x^3 - x, x->3x^2 - 1, 1/sqrt(5))
println("x = $x, iter = $iter")

using Printf

f(x) = x^2 - 1.0
fder(x) = 2x
x = 10.0
k = 0
@printf("%2s  %11s  %11s\n", "k", "f(x)", "x_k - 1.0")
@printf("%-2d  %+10.4e  %+10.4e\n", k, f(x), x - 1.0)
while abs(f(x)) > 1e-12
    global x # hide
    x = x - f(x)/fder(x)
    k += 1
    @printf("%-2d  %+10.4e  %+10.4e\n", k, f(x), x - 1.0)
end

f(x) = (x - 1.0)^2
fder(x) = 2(x - 1.0)
x = 10.0
k = 0
@printf("%2s  %11s  %11s\n", "k", "f(x)", "x_k - 1.0")
@printf("%-2d  %+10.4e  %+10.4e\n", k, f(x), x - 1.0)
while abs(f(x)) > 1e-12
    global x # hide
    x = x - f(x)/fder(x)
    k += 1
    @printf("%-2d  %+10.4e  %+10.4e\n", k, f(x), x - 1.0)
end

newton(x -> exp(-x) * x - 1, x -> exp(-x) * (-x + 1), 1.0, atol=1e-12, rtol=0.0)

function secante(f, a, b; atol = 1e-6, rtol = 1e-6, maxiter = 30, fdertol = 1e-6, xtol = 1e-6)
    #Exercício
    x = b
    xold = a
    fx = f(x)
    fold = f(xold)
    iter = 0
    ϵ = atol + rtol * abs(fx)
    while !(abs(fx) <= ϵ || iter > maxiter)
        m = (fx - fold) / (x - xold)
        if abs(m) < fdertol
            error("Inclinação muito próxima de zero")
        end
        @printf("%15.9e  %8.2e\n", x, fx)
        xold, fold = x, fx
        x = x - fx/m
        if abs(x - xold) < xtol
            error("Passo muito pequeno")
        end
        fx = f(x)
        iter += 1
    end
    return x, fx, iter
end

secante(x->x^2 - 2, 0, 1)

secante(x->exp(-x) - x, 0, 1)

secante(x -> x * exp(x) - 1, -1.0, -0.9)

using ForwardDiff

f(x) = exp(x) * x - 1
g(x) = ForwardDiff.derivative(f, x)

(f(2 + 1e-8) - f(2)) / 1e-8 - exp(2) * 3

g(2) - exp(2) * 3

f(x) = begin
    println("f em $x")
    return exp(x) * x
end
f(2)

g(x) = ForwardDiff.derivative(f, x)
g(2)

