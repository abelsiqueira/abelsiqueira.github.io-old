# This file was generated, do not modify it. # hide
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