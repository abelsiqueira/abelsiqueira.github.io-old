# This file was generated, do not modify it. # hide
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