# This file was generated, do not modify it. # hide
scatter(leg=false)
scatter!(x_tr, y_tr, c=:blue)
plot!(x -> β[1] + sum(β[j + 1] * x^j for j = 1:p), 0, 1.0, c=:green, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin32"))