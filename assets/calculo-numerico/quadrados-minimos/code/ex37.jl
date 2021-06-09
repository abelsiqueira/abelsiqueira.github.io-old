# This file was generated, do not modify it. # hide
f(t) = sum(α[i] * F[i](t) for i = 1:3)

scatter(t, b, leg=false)
plot!(f, 0, 1, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin21"))