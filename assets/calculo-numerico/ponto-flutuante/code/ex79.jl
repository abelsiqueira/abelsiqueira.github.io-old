# This file was generated, do not modify it. # hide
h = 1e-4
plot(x->f(x) - DF(x, h), -10, 10, c=:red)
png(joinpath(@OUTPUT, "fig-der4")) # hide