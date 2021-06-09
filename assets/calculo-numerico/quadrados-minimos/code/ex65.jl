# This file was generated, do not modify it. # hide
A = [ones(10) t]
α = (A'*A)\(A'*log.(T .- Ta))
scatter(t, log.(T .- Ta), c=:blue)
plot!(t, α[1] .+ α[2] * t, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin41"))