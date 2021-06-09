# This file was generated, do not modify it. # hide
t = range(-2, stop=3, length=200)
x = cos.(t*pi*2) .* exp.(t)
y = sin.(t*pi*2) .* exp.(t)
plot(x, y)
xlims!(-20, 30)
ylims!(-30, 20)
png(joinpath(@OUTPUT, "plt-ex7")) # hide