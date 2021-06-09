# This file was generated, do not modify it. # hide
f(x) = exp(x) + cos(3π * x) * 0.5 + 3
F(x) = exp(x) + sin(3π * x) / 6π + 3x
a, b = -2, 2
plot(f, a, b, c=:red, fill=(0,:red,0.5), leg=false)
plot!(x->f(a) + (x - a) * (f(b) - f(a)) / (b - a), a, b, c=:blue, fill=(0,:blue,0.5))
scatter!([a, b], [f(a), f(b)], c=:blue)
png(joinpath(@OUTPUT, "fig-int3"))