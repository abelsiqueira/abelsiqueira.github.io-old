# This file was generated, do not modify it. # hide
f(x) = exp(x) + cos(3π*x) * 0.5 + 3
a, b = -2, 2
p = plot(f, a, b, c=:red, lw=2, fill=(0,:red,0.3), leg=false)
m = 5
h = (b - a) / (m - 1)

for i = 1:m-1
    xi = a + (i-1) * h
    xip = xi + h
    L(x) = f(xi) + (x-xi) * (f(xip) - f(xi)) / h
    plot!(p, L, xi, xip, c=:blue, fill=(0,:blue,0.4))
    scatter!([xi; xip], [f(xi); f(xip)], c=:blue, ms=5)
end
xticks!(a:h:b, ["x$i" for i = 1:m])
png(joinpath(@OUTPUT, "fig-int8")) # hide