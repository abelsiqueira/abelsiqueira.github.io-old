# This file was generated, do not modify it. # hide
using Random, Statistics
Random.seed!(0)
m = 10
x = collect(range(-3, 7, length=m))
y = 1.9 .+ 0.6*x + randn(m)*0.75 # Gerando pontos aleatórios

M = [m sum(x); sum(x) dot(x,x)]
b = [sum(y); dot(x,y)]
α = M \ b
p = 1
α = regressao_polinomial(x, y, p)

y_pred = α[1] .+ α[2] * x# + α[3] * x.^2 + α[4] * x.^3
y_pred = α[1] .+ sum(α[j+1] * x.^j for j = 1:p)
y_med = mean(y)

scatter(x, y, leg=false)
plot!([x[1], x[end]], [y_med, y_med], c=:blue)
for i = 1:m
    plot!([x[i], x[i]], [y[i], y_med], c=:red, l=:dash)
end
title!("y_Med")
png(joinpath(@OUTPUT, "fig-quadmin23"))