# This file was generated, do not modify it. # hide
a = 1.0
b = 3.0
m = 9
h = (b - a) / (m + 1)

collect(range(a+h, b-h, length=m))

scatter([a; b], zeros(2), c=:blue, ms=10, leg=false)
scatter!(range(a+h, b-h, length=m), zeros(m), c=:red)
ylims!(-1, 1)
png(joinpath(@OUTPUT, "fig-int2"))