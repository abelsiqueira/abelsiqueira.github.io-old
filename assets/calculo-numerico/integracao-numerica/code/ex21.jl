# This file was generated, do not modify it. # hide
f(x) = exp(x) + cos(3π*x) * 0.5 + 3
a, b = -2, 2
p = plot(f, a, b, c=:red, lw=2, fill=(0,:red,0.3), leg=false)
m = 5
h = (b - a) / (m + 1)

for i = 1:2:m
    xi = a + i * h
    plot!(p, x->f(xi), xi - h, xi + h, c=:blue, fill=(0,:blue,0.4))
    scatter!([xi], [f(xi)], ms=5, c=:blue)
end
xticks!(a:h:b, ["x$i" for i = 0:m+1])
png(joinpath(@OUTPUT, "fig-int9")) # hide