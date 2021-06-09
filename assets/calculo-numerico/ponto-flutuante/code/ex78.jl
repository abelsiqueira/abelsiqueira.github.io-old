# This file was generated, do not modify it. # hide
h = 1e-4
plot(f, -10, 10, c=:blue)
plot!(x->DF(x, h), -10, 10, c=:red)
png(joinpath(@OUTPUT, "fig-der3")) # hide