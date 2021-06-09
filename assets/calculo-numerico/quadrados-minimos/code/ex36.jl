# This file was generated, do not modify it. # hide
α = quadmin(t, b, F)
scatter(t, b, leg=false, ms=3, c=:lightblue)
#plot!(t->α[1]*F[1](t) + α[2]*F[2](t) + α[3]*F[3](t), 0, 1, c=:red, lw=2)
plot!(t -> sum(α[j]*F[j](t) for j = 1:n), 0, 1, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin20"))