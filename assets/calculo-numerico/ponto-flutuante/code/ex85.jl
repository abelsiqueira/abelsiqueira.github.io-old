# This file was generated, do not modify it. # hide
D_av(f, x, h) = (f(x + h) - f(x)) / h
D_ct(f, x, h) = (f(x + h) - f(x - h)) / 2h
hs = []
E_av = []
E_ct = []
E_ct2 = []
h = 1.0
x = 1.0
f(x) = exp(x)
fx = exp(x)
while h > 1e-16
    global h # hide
    push!(hs, h)
    E = abs(fx - D_av(f, x, h))/abs(fx)
    push!(E_av, E)
    E = abs(fx - D_ct(f, x, h))/abs(fx)
    push!(E_ct, E)
    h = h /= 2
end
plot(hs, E_av, m=3, xaxis=:log, yaxis=:log, c=:blue)
plot!(hs, E_ct, m=3, xaxis=:log, yaxis=:log, c=:red)
png(joinpath(@OUTPUT, "fig-der7")) # hide