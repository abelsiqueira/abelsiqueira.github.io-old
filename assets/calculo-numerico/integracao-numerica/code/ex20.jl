# This file was generated, do not modify it. # hide
function trapezio_composto(f, a, b; m = 10) # Note que não faremos mais o trapézio aberto.
    h = (b - a) / (m - 1)
    I = 0.0
    xi = a
    for i = 2:m-1
        xi += h
        I += f(xi)
    end
    I = f(a) + 2I + f(b)
    return I * h / 2
end

f(x) = log(x)
F(x) = x * log(x) - x
a, b = 1, MathConstants.e
println("∫f(x)dx = $(F(b) - F(a))")
for m = 10:10:100
    Ia = trapezio_composto(f, a, b, m=m)
    Ir = F(b) - F(a)
    E = abs(Ir - Ia) / abs(Ir)
    println("∫f(x)dx ≈ $Ia, Erro Relativo = $E")
end