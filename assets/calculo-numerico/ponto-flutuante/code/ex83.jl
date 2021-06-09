# This file was generated, do not modify it. # hide
plot(x -> x, 1e-4, 1e3, c=:red, xaxis=:log, yaxis=:log)
plot!(x -> x^2, 1e-4, 1e3, c=:blue, xaxis=:log, yaxis=:log)

hs = []
Es = []
h = 1.0
x = 1.0
while h > 1e-16
    global h # hide
    E = abs(f(x) - DF(x, h))
    push!(hs, h)
    push!(Es, E)
    h = h / 2
end
plot(hs, Es, m=3, xaxis=:log, yaxis=:log)
png(joinpath(@OUTPUT, "fig-der5")) # hide