# This file was generated, do not modify it. # hide
m = 100
x = range(-3, 7, length=m)
y = 1.9 .+ 0.6*x + randn(m)*0.3
scatter(x, y, leg=false, c=:lightblue, ms=4)
plot!(x -> 0.58x + 1.92, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin03"))