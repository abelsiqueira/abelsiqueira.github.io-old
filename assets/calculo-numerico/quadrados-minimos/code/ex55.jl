# This file was generated, do not modify it. # hide
scatter(leg=false)
scatter!(x_te, y_te, c=:red)
plot!(x -> β[1] + sum(β[j + 1] * x^j for j = 1:p), 0, 1.0, c=:green, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin33"))