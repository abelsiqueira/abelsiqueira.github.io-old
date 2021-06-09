# This file was generated, do not modify it. # hide
N = collect(1:20)
Erro = [abs(exponencial(5.0, n) - exp(5.0))/exp(5.0) for n in N]
scatter(N, Erro, yaxis=:log)
png(joinpath(@OUTPUT, "plt-exp2"))