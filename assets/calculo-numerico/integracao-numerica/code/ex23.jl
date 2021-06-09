# This file was generated, do not modify it. # hide
tanh(100)

f(x) = exp(x)
F(x) = exp(x)
a, b = 0, 1
cores = [:blue, :red, :magenta]
p = scatter(leg=false, xaxis=:log, yaxis=:log)
Ireal = F(b) - F(a)
for (i,mtd) in enumerate([ponto_medio_composto, trapezio_composto])
    for m = 2 .^ (2:15)
        Iapprox = mtd(f, a, b, m=m)
        E = abs(Ireal - Iapprox) / Ireal
        scatter!(p, [m], [E], c=cores[i])
    end
end
n = [1; 2^16]
plot!(n, (1 ./ n).^2 / 6)
xlims!(1.0, 2^16)
ylims!(1e-11, 1e-1)
png(joinpath(@OUTPUT, "fig-int10"))