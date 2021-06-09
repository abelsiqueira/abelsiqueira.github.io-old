# This file was generated, do not modify it. # hide
scatter(x, y, leg=false)
plot!(x->2 + 0.5*x, x[1], x[m], c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin09"))