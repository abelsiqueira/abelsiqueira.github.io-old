# This file was generated, do not modify it. # hide
using Plots
gr()

f(x) = exp(x)
F(x) = exp(x)
a, b = 0, 1
p = scatter(leg=false, xaxis=:log, yaxis=:log)
Ireal = F(b) - F(a)
for n = 2 .^ (2:15)
    Iapprox = simpson_composto(f, a, b, n=n)
    E = abs(Ireal - Iapprox) / Ireal
    scatter!(p, [n], [E], c=:blue)
end
n = [1; 2^16]
plot!(n, (1 ./ n).^4 / 180)
xlims!(1.0, 2^16)
ylims!(1e-16, 1e-1)
png(joinpath(@OUTPUT, "fig-int11")) # hide