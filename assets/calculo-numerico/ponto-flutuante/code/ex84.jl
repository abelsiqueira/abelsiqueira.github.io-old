# This file was generated, do not modify it. # hide
hs = 10.0 .^ (-11:0.02:-2)
plot(hs, hs / 2, xaxis=:log, yaxis=:log, lab="h / 2")
plot!(hs, 2e-16 ./ hs, c=:red, lab="2e-16 / h")
png(joinpath(@OUTPUT, "fig-der6")) # hide