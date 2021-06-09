# This file was generated, do not modify it. # hide
x = range(0, 1, length=100) # 100 elementos igual. esp. de 0 a 1
y = x.^2
plot(x, y)
png(joinpath(@OUTPUT, "plt-ex2")) # hide