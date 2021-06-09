# This file was generated, do not modify it. # hide
using Plots
gr(size=(600,400))
f(x) = x^2 - 2
plot(f, 0, 3, c=:blue, lab="f", leg=:topleft)
plot!(x->0, 0, 3, c=:black, lab="")
a = 2.5
scatter!([a], [f(a)], c=:red, lab="x0")
L(x) = f(a) + 2 * a * (x - a)
plot!(L, 0, 3, c=:red, lab="L0")
ylims!(-2, 5)
png(joinpath(@OUTPUT, "fig-zeros1"))