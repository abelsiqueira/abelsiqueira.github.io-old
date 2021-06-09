# This file was generated, do not modify it. # hide
x = sort(rand(500)*3 .+ 1)
y = 2.1*x.^(5.5) .* (1 .+ rand(500)*0.5)
scatter(x, y, ms=3)
png(joinpath(@OUTPUT, "fig-quadmin45"))