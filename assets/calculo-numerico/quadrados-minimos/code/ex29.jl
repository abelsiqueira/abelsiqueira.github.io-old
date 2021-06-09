# This file was generated, do not modify it. # hide
n = 1000
x = range(-2, 3, length=n)
y = exp.(-x) .* x + randn(n)
scatter(x, y)
png(joinpath(@OUTPUT, "fig-quadmin15"))