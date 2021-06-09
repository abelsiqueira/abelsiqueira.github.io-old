# This file was generated, do not modify it. # hide
E(α,β) = 0.5 * sum((y[i] - α - β * x[i])^2 for i = 1:m)
contour(range(1, 3, length=100),
        range(0.0, 1.0, length=100),
        E,
        levels = 100)
png(joinpath(@OUTPUT, "fig-quadmin04"))