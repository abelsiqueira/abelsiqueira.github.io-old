# This file was generated, do not modify it. # hide
plot(x->DF(x, h) - f(x), -1, 1, c=:blue)
png(joinpath(@OUTPUT, "fig-der2")) # hide