# This file was generated, do not modify it. # hide
m = 365
t = range(0, 1, length=m)
v1 = ones(m)
v2 = sin.(2π * t)
v3 = cos.(2π * t)
y = 6 * v1 + 4 * v2 + 12 * v3 + randn(m)*2.0 +
    [rand() < 0.2 ? randn() * 3.5 : 0.0 for i = 1:m]
M = [dot(v1, v1) dot(v1, v2) dot(v1, v3);
     dot(v2, v1) dot(v2, v2) dot(v2, v3);
     dot(v3, v1) dot(v3, v2) dot(v3, v3)]
c = [dot(v1, y); dot(v2, y); dot(v3, y)]
α = M \ c
y_pred = α[1] * v1 + α[2] * v2 + α[3] * v3
y_med = mean(y)
y_quase = 6.5 * v1 + 4.5 * v2 + 11 * v3

scatter(t, y, c=:black, ms=1, leg=false)
plot!([t[1], t[end]], [y_med, y_med], c=:black, l=:dash, lw=1)
plot!(t, y_quase, c=:blue, lw=2)
plot!(t, y_pred, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin26"))