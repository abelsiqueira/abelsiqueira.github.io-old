# This file was generated, do not modify it. # hide
using DelimitedFiles

x = 2 .+ rand(200) * 6 # hide
y = 40 .+ 12x .+ exp.(-x) + randn(200) # hide
open("dados.csv", "w") do io # hide
    writedlm(io, [x, y]) # hide
end # hide
data = readdlm("dados.csv", ',')
x, y = data[:,1], log.(data[:,2] .- 44)
p = 3
β = regressao_polinomial(x, y, p)
scatter(x, y, leg=false)
plot!(x -> β[1] + sum(β[j+1]*x^j for j = 1:p), x[1], x[end], lw=2, c=:red)
png(joinpath(@OUTPUT, "fig-quadmin18"))