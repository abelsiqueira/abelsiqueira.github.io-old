# This file was generated, do not modify it. # hide
plot(x -> exp(x), -1, 1, c=:red)
plot!(x -> 1, -1, 1, c=:blue, l=:dash)
plot!(x -> 1 + x, -1, 1, c=:blue, l=:dash)
plot!(x -> 1 + x + 0.5x^2, -1, 1, c=:blue, l=:dash)