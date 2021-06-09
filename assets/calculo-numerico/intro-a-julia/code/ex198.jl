# This file was generated, do not modify it. # hide
plot(x->exp(x) * x, -1, 1)
plot!(x->exp(-x), -1, 1)
xlims!(-0.5, 0.5)
ylims!(0.5, 1.5)
png(joinpath(@OUTPUT, "plt-ex6")) # hide