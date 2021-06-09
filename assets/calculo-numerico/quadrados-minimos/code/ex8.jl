# This file was generated, do not modify it. # hide
scatter(x, y, leg=false, c=:lightblue, ms=4)
plot!(x -> α + β * x, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin06"))