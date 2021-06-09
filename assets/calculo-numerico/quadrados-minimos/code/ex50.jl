# This file was generated, do not modify it. # hide
using Printf
p = 9

β = regressao_polinomial(x, y, p)
y_pred = [β[1] + sum(β[j + 1] * xi^j for j = 1:p) for xi = x]

xlin = range(extrema(x)..., length=100)
ylin = [β[1] + sum(β[j + 1] * xi^j for j = 1:p) for xi = xlin]
scatter(x, y, leg=false)
plot!(xlin, ylin, c=:red, lw=2)
ylims!(0, 10)
R2 = 1 - norm(y - y_pred)^2 / norm(y .- y_med)^2
title!(@sprintf("SQR = %6.4f, R2 = %6.4f", norm(y_pred - y)^2, R2))
png(joinpath(@OUTPUT, "fig-quadmin29"))