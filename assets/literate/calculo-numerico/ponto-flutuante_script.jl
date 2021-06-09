# This file was generated, do not modify it.

x = 2^63-1

x + 1

-x

-x - 2

-(x+1)  # = x + 1??

x * x

y = 2^62

y * y

x * y

(BigInt(2)^63)^2

factorial(20)

factorial(20) * 21

factorial(20) * 21 * 22 * 23

factorial(big"21")

log2(4 * 10^(20))

log2(4 * BigInt(10)^(20))

big"2"^300

factorial(big"30")

bitstring(5.0)

bitstring(6.0)

Inf

Inf > 1e300

1 / Inf

Inf + Inf

NaN

0 / 0

Inf - Inf

NaN + 1

NaN - NaN

1 / NaN

2 > NaN

2 < NaN

2 == NaN

0.0 ^ 0.0

1.0^Inf

1.0^NaN

Inf^NaN

Inf^(1/Inf)

1 / (-1 / Inf)

using Plots
gr(size=(600,400))

x = Float16(0.0)
X = Float16[0.0]
D = Float16[0.0]
while x < Inf
    global x # hide
    y = nextfloat(x)
    y == Inf && break
    d = y - x
    x = y
    push!(X, x)
    push!(D, d)
end

scatter(X, D, ms=1, m=(stroke(0)), leg=false)
yticks!(2 .^ (0:5))
png(joinpath(@OUTPUT, "fig1"))

using Printf

@printf("%20.18f\n", 0.1)

bitstring(0.1)

a = (0.1 + 0.2)
b = 0.3

abs(b - a)

abs(b - a) / a

(0.1 + 0.2 - 0.3) * 2^50

1e-17 * 2^50

bitstring(0.1 + 0.2)

bitstring(0.3)

1.0 + 1e-18

ϵ = 1.0
while 1.0 + ϵ > 1.0
    global ϵ # hide
    ϵ = ϵ/2
end
ϵ = 2ϵ

eps(Float64)

eps(Float16)

eps(0.3 * 2^50)

eps(0.3)

0.1 + 0.2 - 0.3

prevfloat(Inf)

nextfloat(0.0)

(1.0 + 1e-16) + 1e-16 == 1.0 + (1e-16 + 1e-16)

((1.0 + 1e-16) + 1e-16)

(1.0 + (1e-16 + 1e-16))

((1.0 + 1e-16) + 1e-16) - (1.0 + (1e-16 + 1e-16))

a = 1.0
for h = 10.0 .^ (-2:-1:-15)
  v = (sqrt(a + h) - sqrt(a)) / h
  println("h = $h, √$a ≈ $v, erro = $(v - 0.5)")
end

for h = 10.0 .^ (-2:-1:-15)
  v = 1 / (sqrt(a + h) + sqrt(a))
  println("h = $h, √$a ≈ $v, erro = $(v - 0.5)")
end

using Plots
gr(size=(600,400))

Ap1(h) = max(0.5 - (sqrt(1.0 + h) - sqrt(1.0)) / h, eps(Float64) / 2)
Ap2(h) = max(0.5 - 1 / (sqrt(1.0 + h) + sqrt(1.0)), eps(Float64) / 2)
valores_h = [2.0^p for p = range(-50, -10, length=100)]

plot(valores_h, fill(0.5, length(valores_h)), c=:black, l=:dash, lab="Exato")
plot(xaxis=:log, yaxis=:log)
scatter!(valores_h, Ap1.(valores_h), c=:red, lab="Ruim", ms=3)
scatter!(valores_h, Ap2.(valores_h), c=:blue, lab="Boa", ms=3)
png(joinpath(@OUTPUT, "fig-sqrt")) # hide

BigFloat(pi)

big"0.1"

sqrt(2.0)^2 - 2.0

sqrt(big"2.0")^2 - big"2.0"

nextfloat(big"0.0")  # Menor positivo

prevfloat(big"Inf")

setprecision(2^15)
nextfloat(big"0.0") # Menor positivo

BigFloat(pi)

DF(x, h) = (exp(x+h) - exp(x))/h

f(x) = exp(x)

using Plots
gr()
#Aproximação para $h = 1e-4$
h = 1e-4
plot(f, -1, 1, c=:blue)
plot!(x->DF(x, h), -1, 1, c=:red)
png(joinpath(@OUTPUT, "fig-der1")) # hide

plot(x->DF(x, h) - f(x), -1, 1, c=:blue)
png(joinpath(@OUTPUT, "fig-der2")) # hide

h = 1e-4
plot(f, -10, 10, c=:blue)
plot!(x->DF(x, h), -10, 10, c=:red)
png(joinpath(@OUTPUT, "fig-der3")) # hide

h = 1e-4
plot(x->f(x) - DF(x, h), -10, 10, c=:red)
png(joinpath(@OUTPUT, "fig-der4")) # hide

abs(f(1.0) - DF(1.0, 1e-4))/f(1.0)

abs(f(1.0) - DF(1.0, 1e-5))/f(1.0)

abs(f(1.0) - DF(1.0, 1e-15))/f(1.0)

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

hs = 10.0 .^ (-11:0.02:-2)
plot(hs, hs / 2, xaxis=:log, yaxis=:log, lab="h / 2")
plot!(hs, 2e-16 ./ hs, c=:red, lab="2e-16 / h")
png(joinpath(@OUTPUT, "fig-der6")) # hide

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

