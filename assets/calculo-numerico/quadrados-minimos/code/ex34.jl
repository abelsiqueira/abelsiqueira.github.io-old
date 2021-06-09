# This file was generated, do not modify it. # hide
data = readdlm("dados.csv", ',')
x, y = data[:,1], data[:,2]
α, β = regressao_linear(x, y)
scatter(x, y, leg=false)
plot!(x -> α + β * x, lw=2, c=:red)
png(joinpath(@OUTPUT, "fig-quadmin19"))