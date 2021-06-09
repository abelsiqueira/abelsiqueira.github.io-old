# This file was generated, do not modify it. # hide
f(x) = exp(x)
F(x) = exp(x)
a, b = 0, 1
Ir = F(b) - F(a)
println("E_PM = $(Ir - ponto_medio_composto(f, a, b, m=100))")
println("E_TR = $(Ir - trapezio_composto(f, a, b, m=100))")