# This file was generated, do not modify it. # hide
a = 0
f(x) = exp(x)
F(x) = exp(x)
cores = [:blue, :red, :magenta]
scatter(leg=false, xaxis=:log, yaxis=:log)
for (i,mtd) in enumerate([ponto_medio, trapezio_fechado, trapezio_aberto])
    b = 1.0
    while b > 1e-6
        Ireal = F(b) - F(a)
        Iapprox = mtd(f, a, b)
        E = abs(Ireal - Iapprox) / Ireal
        scatter!([b], [E], c=cores[i])
        b /= 2.0
    end
end
b = [1.0; 1e-6]
plot!(b, b.^3 .* exp.(b) ./ (F.(b) .- F(a)) / 12)
png(joinpath(@OUTPUT, "fig-int5")) # hide