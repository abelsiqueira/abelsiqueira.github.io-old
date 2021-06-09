# This file was generated, do not modify it. # hide
p = 1
β = regressao_polinomial(x, y, p)
xlin = range(extrema(x)..., length=100)
y_pred = [β[1] + sum(β[j + 1] * xi^j for j = 1:p) for xi = xlin]
scatter(x, y, leg=false)
plot!(xlin, y_pred, c=:red, lw=2)
#ylims!(4.9, 8.1)
png(joinpath(@OUTPUT, "fig-quadmin28"))