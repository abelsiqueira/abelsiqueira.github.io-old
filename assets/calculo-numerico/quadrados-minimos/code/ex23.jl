# This file was generated, do not modify it. # hide
m = 365
t = range(0, 1, length=m)
v1 = ones(m)
v2 = sin.(2π * t)
v3 = cos.(2π * t)
M = [dot(v1, v1) dot(v1, v2) dot(v1, v3);
     dot(v2, v1) dot(v2, v2) dot(v2, v3);
     dot(v3, v1) dot(v3, v2) dot(v3, v3)]
c = [dot(v1, b); dot(v2, b); dot(v3, b)]

α, β, γ = M\c

scatter(t, b, leg=false)
plot!(t->α + β*sin(2π*t) + γ*cos(2π*t), 0, 1, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin13"))