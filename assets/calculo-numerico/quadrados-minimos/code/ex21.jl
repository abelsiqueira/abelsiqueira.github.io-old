# This file was generated, do not modify it. # hide
using Random
Random.seed!(0)
m = 365 * 5
t = range(0, 5, length=m)

phi1(t) = sin(2pi*t)
phi2(t) = cos(2pi*t)
phi3(t) = 1

b = 6*phi1.(t) + 4*phi2.(t) + 12*phi3.(t) + randn(m)*1.1 +
    [rand() < 0.2 ? randn() * 3.5 : 0.0 for i = 1:m]
y = b

scatter(t, b, c=:lightblue, ms=3, leg=false)
png(joinpath(@OUTPUT, "fig-quadmin11"))