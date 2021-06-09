# This file was generated, do not modify it. # hide
Random.seed!(0)
m = 40
#x = sort(rand(m))
x = range(0, 1, length=m)
#y = 5 + 3x - 2x.^2 + randn(m) * 0.05
y = 6 .- 3 * sin.(2π * x) + 7 * cos.(2π * x) + randn(m) * 1.5
scatter(x, y, leg=false)
png(joinpath(@OUTPUT, "fig-quadmin31"))