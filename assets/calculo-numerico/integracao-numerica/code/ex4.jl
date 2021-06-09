# This file was generated, do not modify it. # hide
scatter([a; b], zeros(2), c=:blue, ms=10, leg=false)
scatter!(range(a, b, length=m), zeros(m), c=:red)
ylims!(-1, 1)
png(joinpath(@OUTPUT, "fig-int1"))