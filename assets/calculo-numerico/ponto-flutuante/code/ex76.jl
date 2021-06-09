# This file was generated, do not modify it. # hide
using Plots
gr()
#Aproximação para $h = 1e-4$
h = 1e-4
plot(f, -1, 1, c=:blue)
plot!(x->DF(x, h), -1, 1, c=:red)
png(joinpath(@OUTPUT, "fig-der1")) # hide