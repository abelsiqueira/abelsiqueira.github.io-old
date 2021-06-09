# This file was generated, do not modify it. # hide
ϕ₁ = ones(m)
ϕ₂ = sin.(2π * t)
ϕ₃ = cos.(2π * t)

M = [dot(ϕ₁, ϕ₁)  dot(ϕ₂, ϕ₁)  dot(ϕ₃, ϕ₁);
     dot(ϕ₁, ϕ₂)  dot(ϕ₂, ϕ₂)  dot(ϕ₃, ϕ₂);
     dot(ϕ₁, ϕ₃)  dot(ϕ₂, ϕ₃)  dot(ϕ₃, ϕ₃)]
c = [dot(ϕ₁, y); dot(ϕ₂, y); dot(ϕ₃, y)]

β = M \ c
y_pred = β[1] * ϕ₁ + β[2] * ϕ₂ + β[3] * ϕ₃

scatter(t, y, c=:lightblue, ms=3, leg=false)
plot!(t, y_pred, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin12"))