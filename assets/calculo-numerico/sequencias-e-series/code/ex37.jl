# This file was generated, do not modify it. # hide
using Plots
gr(size=(400,300))

N = collect(1:20)
Erro = [abs(exponencial(1.0, n) - exp(1.0))/exp(1.0) for n in N]
scatter(N, Erro, yaxis=:log)
png(joinpath(@OUTPUT, "plt-exp1")) # hide