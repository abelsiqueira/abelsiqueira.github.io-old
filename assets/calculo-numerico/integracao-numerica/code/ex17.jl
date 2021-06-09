# This file was generated, do not modify it. # hide
function simpson(f, a, b)
    h = (b - a) / 2
    return h * (f(a) + 4 * f(a + h) + f(b)) / 3
end

function aberta3pontos(f, a, b)
    h = (b - a) / 4
    return 4h * (2 * f(a + h) + 2 * f(b - h) - f(a + 2h)) / 3
end

a = 0.0
f(x) = exp(x)
F(x) = exp(x)
cores = [:blue, :red, :magenta]
scatter(leg=false, xaxis=:log, yaxis=:log)
for (i,mtd) in enumerate([simpson, aberta3pontos])
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
plot!(b, b.^5 .* exp.(b) ./ (F.(b) .- F(a)) / 2880)
png(joinpath(@OUTPUT, "fig-int7")) # hide