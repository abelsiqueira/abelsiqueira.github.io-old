# This file was generated, do not modify it. # hide
scatter(x, y, leg=false)
plot!(x -> β[1] + β[2] * x + β[3] * x^2, -0.5, 4.5, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin17"))