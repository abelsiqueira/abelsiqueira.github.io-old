# This file was generated, do not modify it. # hide
plot(f, a, b, c=:red, fill=(0,:red,0.5), leg=false)
x1, x2 = (2a+b)/3, (a+2b)/3
plot!(x->f(x1) + (x-x1)*(f(x2)-f(x1))/(x2-x1), a, b, c=:blue, fill=(0,:blue,0.5))
scatter!([x1, x2], [f(x1), f(x2)], c=:blue)
png(joinpath(@OUTPUT, "fig-int4"))