# This file was generated, do not modify it. # hide
function trapezio_fechado(f, a, b)
    return (b-a)*(f(a)+f(b))/2
end

function trapezio_aberto(f, a, b)
    h = (b-a)/3
    return (b-a)*(f(a+h)+f(b-h))/2
end

f(x) = exp(x)
F(x) = exp(x)
a, b = 0, 1

trapezio_fechado(exp, 0, 1)