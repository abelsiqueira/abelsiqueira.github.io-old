# This file was generated, do not modify it. # hide
ϕ1(x) = log(x + 2 + 1e-8)
ϕ2(x) = sqrt(x + 2)
ϕ3(x) = 1.0
ϕ4(x) = exp(x)
ϕ5(x) = sin(x)
X = [ϕ1.(x) ϕ2.(x) ϕ3.(x) ϕ4.(x) ϕ5.(x)]
β = (X' * X) \ (X' * y)
scatter(x, y)
plot!(x -> β[1] * ϕ1(x) + β[2] * ϕ2(x) + β[3] * ϕ3(x) + β[4] * ϕ4(x) + β[5] * ϕ5(x), -2, 3, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin16"))