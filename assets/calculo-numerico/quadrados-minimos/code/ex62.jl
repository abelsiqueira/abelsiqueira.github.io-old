# This file was generated, do not modify it. # hide
plot()
for t = 1:1000
    y = β[1] .+ β[2] * x + randn(n) * σ * 10
    X = [ones(n) x]
    βhat = (X' * X) \ (X' * y)
    yhat = X * βhat
    plot!(x, yhat, c=:gray)
end
plot!(x -> β[1] + β[2] * x, -2, 3, c=:black, lw=2, leg=false)
png(joinpath(@OUTPUT, "fig-quadmin39"))