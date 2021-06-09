# This file was generated, do not modify it. # hide
using Plots
gr(size=(600,400))

Ap1(h) = max(0.5 - (sqrt(1.0 + h) - sqrt(1.0)) / h, eps(Float64) / 2)
Ap2(h) = max(0.5 - 1 / (sqrt(1.0 + h) + sqrt(1.0)), eps(Float64) / 2)
valores_h = [2.0^p for p = range(-50, -10, length=100)]

plot(valores_h, fill(0.5, length(valores_h)), c=:black, l=:dash, lab="Exato")
plot(xaxis=:log, yaxis=:log)
scatter!(valores_h, Ap1.(valores_h), c=:red, lab="Ruim", ms=3)
scatter!(valores_h, Ap2.(valores_h), c=:blue, lab="Boa", ms=3)
png(joinpath(@OUTPUT, "fig-sqrt")) # hide