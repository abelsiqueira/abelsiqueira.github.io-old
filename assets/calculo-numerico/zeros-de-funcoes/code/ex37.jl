# This file was generated, do not modify it. # hide
f(x) = x^2 - 2
plot(f, 0, 3, c=:blue, lab="f", leg=:topleft)
plot!(x->0, 0, 3, c=:black, lab="")
a = 2.5
scatter!([a], [f(a)], c=:blue, lab="x0")
a = a - f(a) / 2a
plot!([a; a], [0; f(a)], l=:dash, c=:red, lab="")
scatter!([a], [f(a)], c=:red, lab="x1")
L(x) = f(a) + 2 * a * (x - a)
plot!(L, 0, 3, c=:red, lab="L1")
ylims!(-2, 5)
png(joinpath(@OUTPUT, "fig-zeros2"))