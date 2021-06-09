# This file was generated, do not modify it. # hide
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