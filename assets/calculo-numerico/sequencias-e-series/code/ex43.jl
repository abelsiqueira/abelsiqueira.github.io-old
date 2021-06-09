# This file was generated, do not modify it. # hide
N = collect(1:50)
Erro = [abs(exponencial2(10.0, n) - exp(10.0))/exp(10.0) for n in N]
Erro[findall(Erro .== 0.0)] .= eps()
scatter(N, Erro, yaxis=:log)
ylims!(eps()/2, 1.0)
png(joinpath(@OUTPUT, "plt-exp5")) # hide