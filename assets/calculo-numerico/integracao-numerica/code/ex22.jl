# This file was generated, do not modify it. # hide
function ponto_medio_composto(f, a, b; m = 10)
    I = 0.0
    if m%2 == 0 # Se m não for ímpar, usamos m + 1
        m += 1
    end
    h = (b - a) / (m + 1)
    xi = a + h
    for i = 1:2:m
        I += f(xi)
        xi += 2h
    end
    return I * 2 * h
end

f(x) = log(x)
F(x) = x * log(x) - x
a, b = 1, MathConstants.e
Ir = F(b) - F(a)
println("∫f(x)dx = $Ir")
for m = 10:10:100
    Ia = ponto_medio_composto(f, a, b, m=m)
    E = abs(Ir - Ia) / abs(Ir)
    println("∫f(x)dx ≈ $Ia, Erro Relativo = $E")
end