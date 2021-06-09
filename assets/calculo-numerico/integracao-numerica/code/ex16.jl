# This file was generated, do not modify it. # hide
f(x) = exp(x) + cos(3π*x) * 0.5 + 3
a, b = -2, 2
c = (a+b)/2
interp(x) = f(a) + (x - a) * (f(c) - f(a)) / (c - a) + (x - a) * (x - c) * (f(b) - 2*f(c) + f(a)) / (2 * (c - a)^2)
plot(f, a, b, c=:red, fill=(0,:red,0.5), leg=false)
plot!(interp, a, b, c=:blue, fill=(0,:blue,0.5))
scatter!([a, c, b], [f(a), f(c), f(b)], c=:blue)
png(joinpath(@OUTPUT, "fig-int6")) # hide