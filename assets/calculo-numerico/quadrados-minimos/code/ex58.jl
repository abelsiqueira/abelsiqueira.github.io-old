# This file was generated, do not modify it. # hide
n = 1000
x = range(-2, 3, length=n)
y = β[1] .+ β[2] * x + randn(n) * σ
scatter!(x, y, ms=3, c=:gray)
X = [ones(n) x]
βhat = (X' * X) \ (X' * y)
yhat = X * βhat
#yhat = X * [1.0; 9.0]
plot!(x, yhat, c=:gray)
ylims!(-15, 25)
png(joinpath(@OUTPUT, "fig-quadmin35"))