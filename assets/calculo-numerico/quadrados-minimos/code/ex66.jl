# This file was generated, do not modify it. # hide
scatter(t, T, ms=3)
plot!(t->Ta + exp.(α[1] + α[2] * t), c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin42"))