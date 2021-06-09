# This file was generated, do not modify it. # hide
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