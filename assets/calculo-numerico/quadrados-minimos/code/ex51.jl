# This file was generated, do not modify it. # hide
using Printf

Random.seed!(0)
mais_x = x[1:end] .- (x[2] - x[1]) / 2
mais_y = 3mais_x .+ 5 + randn(length(mais_x)) * 0.75

p = 9
β = regressao_polinomial(x, y, p)
y_pred = [β[1] + sum(β[j + 1] * xi^j for j = 1:p) for xi = mais_x]

xlin = range(extrema(x)..., length=100)
ylin = [β[1] + sum(β[j + 1] * xi^j for j = 1:p) for xi = xlin]
scatter(x, y, leg=false)
scatter!(mais_x, mais_y, c=:red, ms=5)
plot!(xlin, ylin, c=:red, lw=2)

R2 = 1 - norm(mais_y - y_pred)^2 / norm(mais_y .- y_med)^2
title!(@sprintf("SQR = %6.4f, R2 = %6.4f", norm(y_pred - mais_y)^2, R2))
png(joinpath(@OUTPUT, "fig-quadmin30"))