# This file was generated, do not modify it.

using Plots
gr(size=(600,400))

a = 1.0
b = 3.0
m = 11
h = (b - a) / (m - 1)

range(a, b, length=m)

collect(range(a, b, length=m))

scatter([a; b], zeros(2), c=:blue, ms=10, leg=false)
scatter!(range(a, b, length=m), zeros(m), c=:red)
ylims!(-1, 1)
png(joinpath(@OUTPUT, "fig-int1"))

a = 1.0
b = 3.0
m = 9
h = (b - a) / (m + 1)

collect(range(a+h, b-h, length=m))

scatter([a; b], zeros(2), c=:blue, ms=10, leg=false)
scatter!(range(a+h, b-h, length=m), zeros(m), c=:red)
ylims!(-1, 1)
png(joinpath(@OUTPUT, "fig-int2"))

f(x) = exp(x)
a, b = 0, 1
Iexata = MathConstants.e - 1
IPM = (b - a) * f( (a + b) / 2 )
ErroPM = Iexata - IPM
ErroRelPM = abs(ErroPM) / Iexata

function integral_PM(f, a, b)
    x = (a + b) / 2
    h = (b - a) / 2
    return 2h * f(x)
end

integral_PM(exp, 0, 1)

f(x) = exp(x) + cos(3π*x) * 0.5 + 3
F(x) = exp(x) + sin(3π*x)/6π + 3x
a, b = -2, 2
plot(f, a, b, c=:red, fill=(0,:red,0.5), leg=false)
plot!(x->f((a+b)/2), a, b, c=:blue, fill=(0,:blue,0.5))

function ponto_medio(f, a, b)
    return (b - a) * f((a + b) / 2)
end

ponto_medio(f, a, b) - (F(b) - F(a))

f(x) = exp(x) + cos(3π * x) * 0.5 + 3
F(x) = exp(x) + sin(3π * x) / 6π + 3x
a, b = -2, 2
plot(f, a, b, c=:red, fill=(0,:red,0.5), leg=false)
plot!(x->f(a) + (x - a) * (f(b) - f(a)) / (b - a), a, b, c=:blue, fill=(0,:blue,0.5))
scatter!([a, b], [f(a), f(b)], c=:blue)
png(joinpath(@OUTPUT, "fig-int3"))

plot(f, a, b, c=:red, fill=(0,:red,0.5), leg=false)
x1, x2 = (2a+b)/3, (a+2b)/3
plot!(x->f(x1) + (x-x1)*(f(x2)-f(x1))/(x2-x1), a, b, c=:blue, fill=(0,:blue,0.5))
scatter!([x1, x2], [f(x1), f(x2)], c=:blue)
png(joinpath(@OUTPUT, "fig-int4"))

function trapezio_fechado(f, a, b)
    return (b-a)*(f(a)+f(b))/2
end

function trapezio_aberto(f, a, b)
    h = (b-a)/3
    return (b-a)*(f(a+h)+f(b-h))/2
end

f(x) = exp(x)
F(x) = exp(x)
a, b = 0, 1

trapezio_fechado(exp, 0, 1)

trapezio_aberto(exp, 0, 1)

trapezio_fechado(f, a, b) - (F(b)-F(a))

trapezio_aberto(f, a, b) - (F(b)-F(a))

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

f(x) = 2x + 5
F(x) = x^2 + 5x
a, b = 0, 1
ponto_medio(f, a, b) - (F(b) - F(a))

f(x) = exp(x) + cos(3π*x) * 0.5 + 3
a, b = -2, 2
c = (a+b)/2
interp(x) = f(a) + (x - a) * (f(c) - f(a)) / (c - a) + (x - a) * (x - c) * (f(b) - 2*f(c) + f(a)) / (2 * (c - a)^2)
plot(f, a, b, c=:red, fill=(0,:red,0.5), leg=false)
plot!(interp, a, b, c=:blue, fill=(0,:blue,0.5))
scatter!([a, c, b], [f(a), f(c), f(b)], c=:blue)
png(joinpath(@OUTPUT, "fig-int6")) # hide

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

f(x) = x^3 + x^2 + x + 1
F(x) = x^4/4 + x^3/3 + x^2/2 + x
a, b = 0, 1
simpson(f, a, b) - (F(b) - F(a))

f(x) = exp(x) + cos(3π*x) * 0.5 + 3
a, b = -2, 2
p = plot(f, a, b, c=:red, lw=2, fill=(0,:red,0.3), leg=false)
m = 5
h = (b - a) / (m - 1)

for i = 1:m-1
    xi = a + (i-1) * h
    xip = xi + h
    L(x) = f(xi) + (x-xi) * (f(xip) - f(xi)) / h
    plot!(p, L, xi, xip, c=:blue, fill=(0,:blue,0.4))
    scatter!([xi; xip], [f(xi); f(xip)], c=:blue, ms=5)
end
xticks!(a:h:b, ["x$i" for i = 1:m])
png(joinpath(@OUTPUT, "fig-int8")) # hide

function trapezio_composto(f, a, b; m = 10) # Note que não faremos mais o trapézio aberto.
    h = (b - a) / (m - 1)
    I = 0.0
    xi = a
    for i = 2:m-1
        xi += h
        I += f(xi)
    end
    I = f(a) + 2I + f(b)
    return I * h / 2
end

f(x) = log(x)
F(x) = x * log(x) - x
a, b = 1, MathConstants.e
println("∫f(x)dx = $(F(b) - F(a))")
for m = 10:10:100
    Ia = trapezio_composto(f, a, b, m=m)
    Ir = F(b) - F(a)
    E = abs(Ir - Ia) / abs(Ir)
    println("∫f(x)dx ≈ $Ia, Erro Relativo = $E")
end

f(x) = exp(x) + cos(3π*x) * 0.5 + 3
a, b = -2, 2
p = plot(f, a, b, c=:red, lw=2, fill=(0,:red,0.3), leg=false)
m = 5
h = (b - a) / (m + 1)

for i = 1:2:m
    xi = a + i * h
    plot!(p, x->f(xi), xi - h, xi + h, c=:blue, fill=(0,:blue,0.4))
    scatter!([xi], [f(xi)], ms=5, c=:blue)
end
xticks!(a:h:b, ["x$i" for i = 0:m+1])
png(joinpath(@OUTPUT, "fig-int9")) # hide

function ponto_medio_composto(f, a, b; m = 10)
    I = 0.0
    if m%2 == 0 # Se m não for ímpar, usamos m + 1
        m += 1
    end
    h = (b - a) / (m + 1)
    xi = a + h
    for i = 1:2:m
        I += f(xi)
        xi += 2h
    end
    return I * 2 * h
end

f(x) = log(x)
F(x) = x * log(x) - x
a, b = 1, MathConstants.e
Ir = F(b) - F(a)
println("∫f(x)dx = $Ir")
for m = 10:10:100
    Ia = ponto_medio_composto(f, a, b, m=m)
    E = abs(Ir - Ia) / abs(Ir)
    println("∫f(x)dx ≈ $Ia, Erro Relativo = $E")
end

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

f(x) = exp(x)
F(x) = exp(x)
a, b = 0, 1
Ir = F(b) - F(a)
println("E_PM = $(Ir - ponto_medio_composto(f, a, b, m=100))")
println("E_TR = $(Ir - trapezio_composto(f, a, b, m=100))")

a, b = 0, 1
M2 = exp(b) # Pois exp(x) é crescente
ε = 1e-7
hmax = sqrt(6ε / M2 * (b - a))

mmin = (b-a)/hmax - 1

mmin = ceil(Int, (b-a)/hmax - 1)

ponto_medio_composto(f, 0, 1, m=mmin) - (F(b) - F(a))

function simpson_composto(f, a, b; n = 100) # n eh o numero de pontos
    #Implemente
    if n % 2 == 0
        n = n + 1
    end
    h = (b - a) / (n - 1)
    I2 = I4 = 0.0
    x = a + 2h
    for i = 3:2:n-2
        I2 += f(x)
        x += h
        I4 += f(x)
        x += h
    end
    return (f(a) + 4 * f(a + h) + 4I4 + 2I2 + f(b)) * h / 3
end

simpson_composto(exp, 0, 1, n = 100) - (exp(1) - 1)

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

sqrt(pi)

trapezio_composto(x->exp(-x^2), -6, 6, m=100) - sqrt(pi)

sqrt(-log(1e-16))

f(x) = 1 / sqrt(1 - x^2)
simpson_composto(f, -1, 1)

plot(f, -0.9, 0.9)

f(1.0 - 1e-8)

a = 1e-11
simpson_composto(f, -1+a, 1-a, n=1000)

function ponto_medio(f, a, b; n=100)
    #Implemente
end

ponto_medio(exp, 0, 1, n=1000) - (exp(1) - 1)

ponto_medio(f, -1, 1, n=1000) - pi

ponto_medio(x -> x * log(x), 0, 1, n=1000)

x(t) = tanh(pi * sinh(t) / 2)
plot(x, -5, 5)

r = sqrt(3) / 3
QG2 = exp(-r) + exp(r)

exato = exp(1) - exp(-1)

erro_abs = abs(exato - QG2)

erro_rel = erro_abs / abs(exato)

