# This file was generated, do not modify it. # hide
β₀, β₁, β₂ = -62/70, -1/10, 80/70
scatter(x, y)
plot!(x -> β₀ + β₁ * x + β₂ * x^2, -2, 2, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin02"))