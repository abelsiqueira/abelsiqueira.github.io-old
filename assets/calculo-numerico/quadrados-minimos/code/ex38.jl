# This file was generated, do not modify it. # hide
X = [ones(4) collect(1:4)]
y = [2.1; 4.4; 7.3; 15.9]
lny = log.(y)
X \ lny
β = [0.0996; 0.658]
exp.(X * β)

x = collect(1:4)
scatter(x, y, leg=false)
scatter!(x, exp.(X * β), c=:red, ms=5)
plot!(x -> exp(β[1] + β[2] * x), c=:red)
png(joinpath(@OUTPUT, "fig-quadmin22"))