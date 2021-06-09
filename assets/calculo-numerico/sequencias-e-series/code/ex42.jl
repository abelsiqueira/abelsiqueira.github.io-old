# This file was generated, do not modify it. # hide
using Plots
N = collect(1:50)
Erro = [abs(exponencial2(1.0, n) - exp(1.0))/exp(1.0) for n in N]
Erro[findall(Erro .== 0.0)] .= eps()
scatter(N, abs.(Erro), yaxis=:log)
png(joinpath(@OUTPUT, "plt-exp4")) # hide