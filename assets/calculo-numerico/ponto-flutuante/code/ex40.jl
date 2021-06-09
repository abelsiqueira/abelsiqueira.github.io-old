# This file was generated, do not modify it. # hide
using Plots
gr(size=(600,400))

x = Float16(0.0)
X = Float16[0.0]
D = Float16[0.0]
while x < Inf
    global x # hide
    y = nextfloat(x)
    y == Inf && break
    d = y - x
    x = y
    push!(X, x)
    push!(D, d)
end

scatter(X, D, ms=1, m=(stroke(0)), leg=false)
yticks!(2 .^ (0:5))
png(joinpath(@OUTPUT, "fig1"))