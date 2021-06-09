# This file was generated, do not modify it.

using Random # hide
Random.seed!(0) # hide

2 + 3 + 5 + 7 + 11

3 * 5

7 ^ 3

exp(-1) * exp(1)

( sin(3.14159/4) * 2 )^2

pi

( sin(pi/4) * 2 )^2

round(1.2)

abs(-3)

log(2)

log10(2) + log10(5)

log2(2)

x = 3

x ^ 2

y = 2x

y

y - x

1e-2 # 10⁻²

1e3 # 10³

3.45e2

0.1 + 0.2 - 0.3

(1 + sqrt(5)) / 2

[1 2; 3 4]

[4.0 3; 2 1]

[2.0 3.0 4.0 5.0]

rand(3)

rand(2, 3)

ones(3)

zeros(3)

rand(2,4)

v = rand(3)

A = rand(2, 3)

A * v

w = rand(2)

A' * w

A' * A

B = rand(2, 3)

A + B

A * B'

A' * B

A = rand(3, 3)
b = rand(3)
x = A \ b # Resolve o SL

inv(A) * b

A * x - b # É pra ser zero (ou quase)

using LinearAlgebra

norm(A * x - b) # norm = ‖ ⋅ ‖

v = [1.0; 2.0; 3.0]
w = [2.0; -2.0; 2.0]
dot(v, w) # ⟨v,w⟩

v * w'

cross(v, w)

det(A)

A^2 # A * A

A .^ 2 # Cada elemento de A ao quadrado

B = rand(3, 3)

A .* B

v

w

v .^ w

log(2)

log.(A)

exp(A) # Significa outra coisa

exp.(A) # Elemento a elemento

A + 10I

A .+ 1

m, n = size(A)

length(v)

size(v)

length(A)

A = rand(50, 50)
b = A * ones(50);

x = A \ b
norm(x .- 1)

v

v[1]

v[2]

A = rand(3, 3)

A[1,1]

A[2,3]

v[1:2]

A[:,2]

A[1,:]

A[2,3] = 0.0

A

v = rand(5)
v[1] = -v[1]

A = rand(3, 3)

B = rand(3, 2)

[A B] # Mesma linha

[A A A]

[A; B'] # Mesma coluna

[A, B] # NÃO É CONCATENAÇÃO

[A B; B' zeros(2,2)]

[A I]

[A; I]

f(x) = x * exp(-x)
f(2)

f(-3)

f(sqrt(2))

g(a,b) = exp(a + b)

g(2,3)

exp(5)

g(3,-3)

2

x -> sin(x) * x

(x -> sin(x) * x)(pi/4)

h = x -> sin(x) * x

h(pi/4)

function media(a, b)
    return (a + b) / 2
end

media(7, 4)

function reverte(a, b)
    return b, a
end

reverte(5, 3)

function aproxima_derivada(f, a, h)
    Δf = f(a + h) - f(a)
    return Δf / h
end

aproxima_derivada(exp, 1.0, 1e-6)

s(x) = sin(x)

aproxima_derivada(s, pi/6, 1e-8)

sqrt(3) / 2

aproxima_derivada(x->x^2 + 3x + 2, 2, 1e-4)

#Aqui p é opcional
function potencia(x, p=1)
    return x^p
end

potencia(2)

potencia(2, 2)

potencia(2, 10)

potencia(2.0, 10)

A = rand(2,2)

potencia(A, 4)

potencia.(A, 10)

#Aqui, p1 e p2 são opcionais por palavra-chave
function media(a, b; p1 = 1.0, p2 = 1.0)
    return (a * p1 + b * p2) / (p1 + p2)
end

media(2.0, 5.0)

media(2.0, 5.0, p1=2)

media(2.0, 5.0, p2=3)

media(2.0, 5.0, p1=2, p2=3)

θ = [0.0; π / 6; π / 4; π / 3; π / 2]
seno, cosseno = sin.(θ), cos.(θ)
tangente = seno ./ cosseno

[seno cosseno]

1 / 0

function rayleigh(A, v)
    return dot(v, A * v) / dot(v, v)
end

A = [6 1; 1 4]
v = ones(2)
rayleigh(A, v)

v = rand(2)
rayleigh(A, v)

1:5

collect(1:5)

collect(1:2:5)

collect(0.0:0.1:1.0)

collect(range(0, 1, length=11))

range(0, stop=1, step=0.5)

collect(10:-1:1)

for i = 2.0:0.5:3.0
    println(i^2) # Impressão e quebra linha
end

for i = 1:10
    print(i, " ")
end

for i = 1:10
    println("i = $i")
end

using Printf

for i = 1:10
    @printf("i = %010.4e\n", i / 7) # Notação de C
end

x = rand(10)
y = zeros(10)
for i = 1:10
    y[i] = x[i] * i
end

[x y]

y ./ x

for x in [0; pi/6; pi/4; pi/3; pi/2]
    println("sin($x) = $(sin(x))")
end

for i = 3:3:20
    print("$i ")
end

for i in 3:2:10
    println("$i^2 = $(i^2)")
end

[2; 3]

Float64[2; 3]

for x in Any["a", 'b', 0, 3.14, true, MathConstants.e, 3//4, im, ones(2), ones(2,2)]
    println("x: $x    Tipo: $(typeof(x))")
end

n = 6
v = ones(n)
v[n/2] = 2 #Erro esperado

n/2

div(n,2)

div(7, 2)

round(Int, n/2)

10 % 4 # Resto da divisão de 10 por 4

function fatorial(n)
    resultado = 1
    for i = 1:n
        resultado = resultado * i
    end
    return resultado
end

fatorial(4)

fatorial(5)

fatorial(0)

fatorial(4.3) # Nossa implementação não "liga" pra .3

fatorial(-2) # Nossa implementação

function fatorial2(n :: Int)
    resultado = 1
    for i = 1:n
        resultado = resultado * i
    end
    return resultado
end

fatorial2(5)

fatorial2(3.4)

function sinal(x)
    if x > 0
        return 1
    elseif x < 0
        return -1
    else
        return 0
    end
end

sinal(3.2)

sinal(-1.2)

sinal(0.0)

function bhaskara(a, b, c)
    Δ = b^2 - 4 * a * c
    if Δ < 0
        error("Nos reais não tem solução")
    end
    return (-b + sqrt(Δ)) / 2a, (-b - sqrt(Δ)) / 2a
end

bhaskara(1, 0, -1)

bhaskara(1, 0, 1)

bhaskara(1.0, 5.0, 6.0)

bhaskara(0, 1, 1)

Inf / Inf

(NaN * 2 - Inf - NaN) / NaN

function maior_pot(x)
    p = 1
    while p <= x
        p = 2p
    end
    p = div(p, 2)
    return p
end

maior_pot(2)

maior_pot(10)

maior_pot(100)

for n = [1, 10, 100, 1000, 10000, 100000, 1000000]
    p = maior_pot(n)
    println("2ᵏ = p ≤ n, n = $n, p = $p")
end

function mmc(a::Int, b::Int)
    if a < 1 || b < 1
        error("Entrada deve ser de dois inteiros positivos")
    end
    xa, xb = a, b # Múltiplos de a e b
    while (xa != xb) # Não preciso dos parenteses
        if xa < xb
            xa = xa + a
        else
            xb = xb + b
        end
    end
    return xa
end

mmc(2,3)

mmc(5, 7)

mmc(6, 8)

mmc(12, 14)

mmc(3, 5)

mmc(-1, 2)

mmc(2.0, 3.0)

function fatorial3(n :: Int)
    if n ≤ -1
        error("ERRO: Fatorial só está definido para números ≥ 0")
    end
    if n ≥ 20
        error("ERRO: Fatorial de $n explode")
    end
    resultado = 1
    for i = 1:n
        resultado = resultado * i
    end
    return resultado
end

function bhaskara(a, b, c)
    if a == 0
        error("ERRO: Não é quadrática")
    end
    Δ = b^2 - 4 * a * c
    if Δ < 0
        error("Nos reais não tem solução")
    end
    return (-b + sqrt(Δ)) / 2a, (-b - sqrt(Δ)) / 2a
end

function ehprimo(n::Int)
    if n == 1
        return false
    end
    for k = 2:n-1
        if n % k == 0
            return false
        end
    end
    return true
end

using Plots
gr(size=(600,400))
plot([1; 2; 3], [3; 1; 2]) # plot(x, y)
png(joinpath(@OUTPUT, "plt-ex1")) # hide

x = range(0, 1, length=100) # 100 elementos igual. esp. de 0 a 1
y = x.^2
plot(x, y)
png(joinpath(@OUTPUT, "plt-ex2")) # hide

scatter(x, x .* (1 .- x) * 4)
png(joinpath(@OUTPUT, "plt-ex3")) # hide

scatter(x, rand(100))
png(joinpath(@OUTPUT, "plt-ex4")) # hide

f(x) = x * sin(x)
plot(f, 0, 4pi) # plot(f, a, b)
png(joinpath(@OUTPUT, "plt-ex5")) # hide

plot(x->exp(x) * x, -1, 1)
plot!(x->exp(-x), -1, 1)
xlims!(-0.5, 0.5)
ylims!(0.5, 1.5)
png(joinpath(@OUTPUT, "plt-ex6")) # hide

t = range(-2, stop=3, length=200)
x = cos.(t*pi*2) .* exp.(t)
y = sin.(t*pi*2) .* exp.(t)
plot(x, y)
xlims!(-20, 30)
ylims!(-30, 20)
png(joinpath(@OUTPUT, "plt-ex7")) # hide

plot(sin, 0, 2pi, label="sin")
plot!(cos, 0, 2pi, label="cos", c = :magenta)
plot!(x->1, 0, 2pi, c=:red, l=:dash, label="")
plot!(x->-1, 0, 2pi, c=:red, l=:dash, label="")
xlabel!("x in [0,2pi]")
ylabel!("sin, cos")
title!("Funções seno e cosseno")
ylims!(-1.2, 1.2)
xticks!(0:pi/2:2pi, ["0", "\\pi /2", "\\pi", "3\\pi/2", "2\\pi"])
png(joinpath(@OUTPUT, "plt-ex8")) # hide

x = range(0, stop=2*pi, length=100)
anim = Animation()
for i = 1:5:100
    plot(x[1:i], sin.(x[1:i]))
    frame(anim)
end
gif(anim, joinpath(@OUTPUT, "exemplo-1.gif"), fps=12) # hide

x = range(0, stop=2*pi, length=100)
anim = Animation()
for i = 1:3:100
    plot(x[1:i], sin.(x[1:i]))
    xlims!(x[1], x[end])
    ylims!(-1, 1)
    frame(anim)
end
gif(anim, joinpath(@OUTPUT, "exemplo-2.gif"), fps=12) # hide

x = range(0, stop=2*pi, length=100)
anim = Animation()
for i = 1:3:100
    plot(x, sin.(x), leg=false)
    a = x[i]
    scatter!([a], [sin(a)], c=:red)
    plot!(x, sin(a) .+ cos(a) * (x .- a), c=:red, l=:dash)
    xlims!(x[1], x[end])
    ylims!(-2, 2)
    frame(anim)
end
gif(anim, joinpath(@OUTPUT, "exemplo-3.gif"), fps=12) # hide

x = range(0, stop=2*pi, length=100)
anim = Animation()
for i = 1:3:100
    plot(x, sin.(x), leg=false)
    a = x[i]
    scatter!([a], [sin(a)], c=:red)
    plot!(x, sin(a) .+ cos(a) * (x .- a) .- sin(a) * (x .- a).^2 / 2, c=:red, l=:dash)
    xlims!(x[1], x[end])
    ylims!(-2, 2)
    frame(anim)
end
gif(anim, joinpath(@OUTPUT, "exemplo-4.gif"), fps=12) # hide

f(x,y) = x^2 + 4y^2
X = -1:0.05:1
Y = -1:0.05:1
layout = grid(2, 2)
plt = plot(layout = layout)
contour!(plt[1], X, Y, f)
surface!(plt[2], X, Y, f)
wireframe!(plt[3], X, Y, f)
surface!(plt[4], X, Y, f, camera=(60, 60))
png(joinpath(@OUTPUT, "plt-3d1")) # hide

f(x,y) = (y - 0.5) / (x^2 + 1)
layout = grid(2, 2)
plt = plot(layout = layout)
contour!(plt[1], X, Y, f)
surface!(plt[2], X, Y, f)
wireframe!(plt[3], X, Y, f)
surface!(plt[4], X, Y, f, camera=(60, 60))
png(joinpath(@OUTPUT, "plt-3d2")) # hide

u0(x, y) = exp(-((x - y^2)^2 + x^2))
X = -1.5:0.1:2.5
Y = -2:0.1:2
S = sum(u0.(X, Y)) * (X[2] - X[1]) * (Y[2] - Y[1])
u(t,x,y) = exp(-t) * (t * S + u0(x,y) * (1 - t))

t = 0:0.02:1
anim = Animation()
for ti = t
    layout = grid(2, 2)
    plt = plot(layout = layout)
    contour!(plt[1], X, Y, (x,y) -> u(ti,x,y))
    surface!(plt[2], X, Y, (x,y) -> u(ti,x,y))
    wireframe!(plt[3], X, Y, (x,y) -> u(ti,x,y))
    surface!(plt[4], X, Y, (x,y) -> u(ti,x,y), camera=(60, 60))
    zlims!(0, 1)
    frame(anim)
end
gif(anim, joinpath(@OUTPUT, "exemplo-5.gif"), fps=12) # hide

x = rand(100)
y = 2x .+ 3
plot(x, y)
scatter!(x, y)

plot(x -> exp(x), -1, 1, c=:red)
plot!(x -> 1, -1, 1, c=:blue, l=:dash)
plot!(x -> 1 + x, -1, 1, c=:blue, l=:dash)
plot!(x -> 1 + x + 0.5x^2, -1, 1, c=:blue, l=:dash)

