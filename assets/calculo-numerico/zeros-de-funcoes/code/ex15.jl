# This file was generated, do not modify it. # hide
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