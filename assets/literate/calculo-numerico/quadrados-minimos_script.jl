# This file was generated, do not modify it.

using Plots
gr(size=(600,400))

x = [-2, -1, 0, 1, 2.0]
y = [4, 1, -3, 2, 3.0]
scatter(x, y)
png(joinpath(@OUTPUT, "fig-quadmin01"))

β₀, β₁, β₂ = -62/70, -1/10, 80/70
scatter(x, y)
plot!(x -> β₀ + β₁ * x + β₂ * x^2, -2, 2, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin02"))

m = 100
x = range(-3, 7, length=m)
y = 1.9 .+ 0.6*x + randn(m)*0.3
scatter(x, y, leg=false, c=:lightblue, ms=4)
plot!(x -> 0.58x + 1.92, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin03"))

E(α,β) = 0.5 * sum((y[i] - α - β * x[i])^2 for i = 1:m)
contour(range(1, 3, length=100),
        range(0.0, 1.0, length=100),
        E,
        levels = 100)
png(joinpath(@OUTPUT, "fig-quadmin04"))

M11 = m
M12 = M21 = sum(x)
M22 = sum(x.^2)
c1 = sum(y)
c2 = sum(x .* y)

M = [M11 M12; M21 M22]
c = [c1; c2]
αβ = M \ c

α, β = αβ[1], αβ[2]

E(α,β) = 0.5 * sum((y[i] - α - β * x[i])^2 for i = 1:m)
contour(range(1, 3, length=100),
        range(0.0, 1.0, length=100),
        E,
        levels = 50)
scatter!([α], [β], c=:red, ms=3)
png(joinpath(@OUTPUT, "fig-quadmin05"))

scatter(x, y, leg=false, c=:lightblue, ms=4)
plot!(x -> α + β * x, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin06"))

E(0,0)

scatter(x, y, leg=false)
plot!(x->0 + 0*x, x[1], x[m], c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin07"))

E(2,0)

scatter(x, y, leg=false)
plot!(x->2 + 0*x, x[1], x[m], c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin08"))

E(2,0.5)

scatter(x, y, leg=false)
plot!(x->2 + 0.5*x, x[1], x[m], c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin09"))

using LinearAlgebra
dot(x, y)

M = [m  sum(x); sum(x)   dot(x,x)]

b = [sum(y); dot(x,y)]

α, β = M\b

E(α,β)

scatter(x, y, leg=false)
plot!(x->α + β*x, x[1], x[m], c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin10"))

using Random
Random.seed!(0)
m = 365 * 5
t = range(0, 5, length=m)

phi1(t) = sin(2pi*t)
phi2(t) = cos(2pi*t)
phi3(t) = 1

b = 6*phi1.(t) + 4*phi2.(t) + 12*phi3.(t) + randn(m)*1.1 +
    [rand() < 0.2 ? randn() * 3.5 : 0.0 for i = 1:m]
y = b

scatter(t, b, c=:lightblue, ms=3, leg=false)
png(joinpath(@OUTPUT, "fig-quadmin11"))

ϕ₁ = ones(m)
ϕ₂ = sin.(2π * t)
ϕ₃ = cos.(2π * t)

M = [dot(ϕ₁, ϕ₁)  dot(ϕ₂, ϕ₁)  dot(ϕ₃, ϕ₁);
     dot(ϕ₁, ϕ₂)  dot(ϕ₂, ϕ₂)  dot(ϕ₃, ϕ₂);
     dot(ϕ₁, ϕ₃)  dot(ϕ₂, ϕ₃)  dot(ϕ₃, ϕ₃)]
c = [dot(ϕ₁, y); dot(ϕ₂, y); dot(ϕ₃, y)]

β = M \ c
y_pred = β[1] * ϕ₁ + β[2] * ϕ₂ + β[3] * ϕ₃

scatter(t, y, c=:lightblue, ms=3, leg=false)
plot!(t, y_pred, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin12"))

m = 365
t = range(0, 1, length=m)
v1 = ones(m)
v2 = sin.(2π * t)
v3 = cos.(2π * t)
M = [dot(v1, v1) dot(v1, v2) dot(v1, v3);
     dot(v2, v1) dot(v2, v2) dot(v2, v3);
     dot(v3, v1) dot(v3, v2) dot(v3, v3)]
c = [dot(v1, b); dot(v2, b); dot(v3, b)]

α, β, γ = M\c

scatter(t, b, leg=false)
plot!(t->α + β*sin(2π*t) + γ*cos(2π*t), 0, 1, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin13"))

x = [0.0; 1; 2; 3; 4]
y = [-1.0; 1; 1; 3; 5]
scatter(x, y, leg=false)
png(joinpath(@OUTPUT, "fig-quadmin14"))

A = [ones(5)  x  x.^2]

A' * A

A' * y

β = (A' * A) \ (A' * y)

n = 1000
x = range(-2, 3, length=n)
y = exp.(-x) .* x + randn(n)
scatter(x, y)
png(joinpath(@OUTPUT, "fig-quadmin15"))

ϕ1(x) = log(x + 2 + 1e-8)
ϕ2(x) = sqrt(x + 2)
ϕ3(x) = 1.0
ϕ4(x) = exp(x)
ϕ5(x) = sin(x)
X = [ϕ1.(x) ϕ2.(x) ϕ3.(x) ϕ4.(x) ϕ5.(x)]
β = (X' * X) \ (X' * y)
scatter(x, y)
plot!(x -> β[1] * ϕ1(x) + β[2] * ϕ2(x) + β[3] * ϕ3(x) + β[4] * ϕ4(x) + β[5] * ϕ5(x), -2, 3, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin16"))

scatter(x, y, leg=false)
plot!(x -> β[1] + β[2] * x + β[3] * x^2, -0.5, 4.5, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin17"))

"""`regressao_linear(x, y)`
Calcule y ~ α + β x
"""
function regressao_linear(x, y)
    m = length(x)
    A = [ones(m)  x]
    sol = (A' * A) \ (A' * y)
    α, β = sol[1], sol[2]
    return α, β
end

"""
y ~ β₀ + β₁ x + … + βₚ xᵖ
"""
function regressao_polinomial(x, y, p)
    m = length(x)
    A = ones(m, p + 1)
    for i = 1:m
        for j = 2:p+1
            A[i,j] = x[i]^(j - 1)
        end
    end
    β = (A' * A) \ (A' * y)
    return β
end

using DelimitedFiles

x = 2 .+ rand(200) * 6 # hide
y = 40 .+ 12x .+ exp.(-x) + randn(200) # hide
open("dados.csv", "w") do io # hide
    writedlm(io, [x, y]) # hide
end # hide
data = readdlm("dados.csv", ',')
x, y = data[:,1], log.(data[:,2] .- 44)
p = 3
β = regressao_polinomial(x, y, p)
scatter(x, y, leg=false)
plot!(x -> β[1] + sum(β[j+1]*x^j for j = 1:p), x[1], x[end], lw=2, c=:red)
png(joinpath(@OUTPUT, "fig-quadmin18"))

data = readdlm("dados.csv", ',')
x, y = data[:,1], data[:,2]
α, β = regressao_linear(x, y)
scatter(x, y, leg=false)
plot!(x -> α + β * x, lw=2, c=:red)
png(joinpath(@OUTPUT, "fig-quadmin19"))

function quadmin(x, y, F::Array{Function})
    #Implemente
end

F = [x->1, x->sin(2π*x), x->cos(2π*x), x->sin(4π*x), x->cos(4π*x), x->sin(6π*x), x->cos(6π*x)]
n = length(F)

α = quadmin(t, b, F)
scatter(t, b, leg=false, ms=3, c=:lightblue)
#plot!(t->α[1]*F[1](t) + α[2]*F[2](t) + α[3]*F[3](t), 0, 1, c=:red, lw=2)
plot!(t -> sum(α[j]*F[j](t) for j = 1:n), 0, 1, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin20"))

f(t) = sum(α[i] * F[i](t) for i = 1:3)

scatter(t, b, leg=false)
plot!(f, 0, 1, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin21"))

X = [ones(4) collect(1:4)]
y = [2.1; 4.4; 7.3; 15.9]
lny = log.(y)
X \ lny
β = [0.0996; 0.658]
exp.(X * β)

x = collect(1:4)
scatter(x, y, leg=false)
scatter!(x, exp.(X * β), c=:red, ms=5)
plot!(x -> exp(β[1] + β[2] * x), c=:red)
png(joinpath(@OUTPUT, "fig-quadmin22"))

"""
y ~ β₀ + β₁ x + … + βₚ xᵖ
"""
function regressao_polinomial(x, y, p)
    m = length(x)
    A = ones(m, p + 1)
    for i = 1:m
        for j = 2:p+1
            A[i,j] = x[i]^(j - 1)
        end
    end
    β = (A' * A) \ (A' * y)
    return β
end

using Random, Statistics
Random.seed!(0)
m = 10
x = collect(range(-3, 7, length=m))
y = 1.9 .+ 0.6*x + randn(m)*0.75 # Gerando pontos aleatórios

M = [m sum(x); sum(x) dot(x,x)]
b = [sum(y); dot(x,y)]
α = M \ b
p = 1
α = regressao_polinomial(x, y, p)

y_pred = α[1] .+ α[2] * x# + α[3] * x.^2 + α[4] * x.^3
y_pred = α[1] .+ sum(α[j+1] * x.^j for j = 1:p)
y_med = mean(y)

scatter(x, y, leg=false)
plot!([x[1], x[end]], [y_med, y_med], c=:blue)
for i = 1:m
    plot!([x[i], x[i]], [y[i], y_med], c=:red, l=:dash)
end
title!("y_Med")
png(joinpath(@OUTPUT, "fig-quadmin23"))

scatter(x, y, leg=false)
#plot!(x, y_pred, c=:blue)
xlin = range(x[1], x[end], length=100)
ylin = α[1] .+ sum(α[j+1] * xlin.^j for j = 1:p)
plot!(xlin, ylin, c=:blue)
for i = 1:m
    plot!([x[i], x[i]], [y[i], y_pred[i]], c=:red, l=:dash)
end
title!("y_pred")
png(joinpath(@OUTPUT, "fig-quadmin24"))

R2 = 1 - norm(y_pred - y)^2 / norm(y_med .- y)^2

y_nao_otimo = 1.9 .+ 0.6*x # Escolhido sabiamente

scatter(x, y, leg=false)
plot!(x, y_nao_otimo, c=:blue)
for i = 1:m
    plot!([x[i], x[i]], [y[i], y_nao_otimo[i]], c=:red, l=:dash)
end
title!("y_nao_otimo")
png(joinpath(@OUTPUT, "fig-quadmin25"))

R2 = 1 - norm(y_nao_otimo - y)^2 / norm(y_med .- y)^2

m = 365
t = range(0, 1, length=m)
v1 = ones(m)
v2 = sin.(2π * t)
v3 = cos.(2π * t)
y = 6 * v1 + 4 * v2 + 12 * v3 + randn(m)*2.0 +
    [rand() < 0.2 ? randn() * 3.5 : 0.0 for i = 1:m]
M = [dot(v1, v1) dot(v1, v2) dot(v1, v3);
     dot(v2, v1) dot(v2, v2) dot(v2, v3);
     dot(v3, v1) dot(v3, v2) dot(v3, v3)]
c = [dot(v1, y); dot(v2, y); dot(v3, y)]
α = M \ c
y_pred = α[1] * v1 + α[2] * v2 + α[3] * v3
y_med = mean(y)
y_quase = 6.5 * v1 + 4.5 * v2 + 11 * v3

scatter(t, y, c=:black, ms=1, leg=false)
plot!([t[1], t[end]], [y_med, y_med], c=:black, l=:dash, lw=1)
plot!(t, y_quase, c=:blue, lw=2)
plot!(t, y_pred, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin26"))

ST = norm(y .- y_med)^2
Sr_quase = norm(y - y_quase)^2
Sr_pred = norm(y - y_pred)^2
R2_quase = 1 - Sr_quase / ST
R2_pred = 1 - Sr_pred / ST
println("R2_quase = $R2_quase")
println("R2_pred = $R2_pred")

function regressao_polinomial(x, y, p)
    m = length(x)
    A = [ones(m) [x[i]^j for i = 1:m, j = 1:p]]
    #β = (A' * A) \ (A' * y)
    β = A \ y
    return β
end

Random.seed!(0)
m = 10
x = sort(rand(m))
#x = collect(range(-1, 1, length=m))
y = 3x .+ 5 + randn(m) * 0.25
scatter(x, y, leg=false)
png(joinpath(@OUTPUT, "fig-quadmin27"))

p = 1
β = regressao_polinomial(x, y, p)
xlin = range(extrema(x)..., length=100)
y_pred = [β[1] + sum(β[j + 1] * xi^j for j = 1:p) for xi = xlin]
scatter(x, y, leg=false)
plot!(xlin, y_pred, c=:red, lw=2)
#ylims!(4.9, 8.1)
png(joinpath(@OUTPUT, "fig-quadmin28"))

y_med = mean(y)
y_pred = [β[1] .+ sum(β[j + 1] * x[i].^j for j = 1:p) for i = 1:m]
ST = norm(y .- y_med)^2
Sr_pred = norm(y - y_pred)^2
R2_pred = 1 - Sr_pred / ST

using Printf
p = 9

β = regressao_polinomial(x, y, p)
y_pred = [β[1] + sum(β[j + 1] * xi^j for j = 1:p) for xi = x]

xlin = range(extrema(x)..., length=100)
ylin = [β[1] + sum(β[j + 1] * xi^j for j = 1:p) for xi = xlin]
scatter(x, y, leg=false)
plot!(xlin, ylin, c=:red, lw=2)
ylims!(0, 10)
R2 = 1 - norm(y - y_pred)^2 / norm(y .- y_med)^2
title!(@sprintf("SQR = %6.4f, R2 = %6.4f", norm(y_pred - y)^2, R2))
png(joinpath(@OUTPUT, "fig-quadmin29"))

using Printf

Random.seed!(0)
mais_x = x[1:end] .- (x[2] - x[1]) / 2
mais_y = 3mais_x .+ 5 + randn(length(mais_x)) * 0.75

p = 9
β = regressao_polinomial(x, y, p)
y_pred = [β[1] + sum(β[j + 1] * xi^j for j = 1:p) for xi = mais_x]

xlin = range(extrema(x)..., length=100)
ylin = [β[1] + sum(β[j + 1] * xi^j for j = 1:p) for xi = xlin]
scatter(x, y, leg=false)
scatter!(mais_x, mais_y, c=:red, ms=5)
plot!(xlin, ylin, c=:red, lw=2)

R2 = 1 - norm(mais_y - y_pred)^2 / norm(mais_y .- y_med)^2
title!(@sprintf("SQR = %6.4f, R2 = %6.4f", norm(y_pred - mais_y)^2, R2))
png(joinpath(@OUTPUT, "fig-quadmin30"))

Random.seed!(0)
m = 40
#x = sort(rand(m))
x = range(0, 1, length=m)
#y = 5 + 3x - 2x.^2 + randn(m) * 0.05
y = 6 .- 3 * sin.(2π * x) + 7 * cos.(2π * x) + randn(m) * 1.5
scatter(x, y, leg=false)
png(joinpath(@OUTPUT, "fig-quadmin31"))

Random.seed!(0)
I = randperm(m)
x, y = x[I], y[I]
k = round(Int, 0.6m)
x_tr, y_tr, x_te, y_te = x[1:k], y[1:k], x[k+1:end], y[k+1:end]

p = 6
β = regressao_polinomial(x_tr, y_tr, p) # Apenas o conjunto de treino é usado
y_pred = [β[1] + sum(β[j + 1] * xi^j for j = 1:p) for xi = x_te]
erro = 0.5 * norm(y_te - y_pred)^2

scatter(leg=false)
scatter!(x_tr, y_tr, c=:blue)
plot!(x -> β[1] + sum(β[j + 1] * x^j for j = 1:p), 0, 1.0, c=:green, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin32"))

scatter(leg=false)
scatter!(x_te, y_te, c=:red)
plot!(x -> β[1] + sum(β[j + 1] * x^j for j = 1:p), 0, 1.0, c=:green, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin33"))

max_p = 15
erro_treino = []
erro_teste = []
for p = 1:max_p
    β = regressao_polinomial(x_tr, y_tr, p)
    xlin = range(0, 1, length=100)
    y_pred = [β[1] + sum(β[j + 1] * xi^j for j = 1:p) for xi = x]
    push!(erro_treino, 0.5 * norm(y_tr - y_pred[1:k])^2 / k)
    push!(erro_teste, 0.5 * norm(y_te - y_pred[k+1:end])^2 / (m - k))
end

scatter(1:max_p, erro_treino, c=:blue, leg=false, yaxis=:log)
plot!(1:max_p, erro_treino, c=:blue)
scatter!(1:max_p, erro_teste, c=:red)
plot!(1:max_p, erro_teste, c=:red)
png(joinpath(@OUTPUT, "fig-quadmin34"))

β = [3.0; 5.0]
σ = 2.7
plot(x -> β[1] + β[2] * x, -2, 3, c=:black, lw=2, leg=false)

n = 1000
x = range(-2, 3, length=n)
y = β[1] .+ β[2] * x + randn(n) * σ
scatter!(x, y, ms=3, c=:gray)
X = [ones(n) x]
βhat = (X' * X) \ (X' * y)
yhat = X * βhat
#yhat = X * [1.0; 9.0]
plot!(x, yhat, c=:gray)
ylims!(-15, 25)
png(joinpath(@OUTPUT, "fig-quadmin35"))

scatter(x, y - yhat, c=:gray)
png(joinpath(@OUTPUT, "fig-quadmin36"))

scatter(x * 0, y - yhat, c=:gray)
png(joinpath(@OUTPUT, "fig-quadmin37"))

histogram(x, y - yhat, bins=20)
png(joinpath(@OUTPUT, "fig-quadmin38"))

plot()
for t = 1:1000
    y = β[1] .+ β[2] * x + randn(n) * σ * 10
    X = [ones(n) x]
    βhat = (X' * X) \ (X' * y)
    yhat = X * βhat
    plot!(x, yhat, c=:gray)
end
plot!(x -> β[1] + β[2] * x, -2, 3, c=:black, lw=2, leg=false)
png(joinpath(@OUTPUT, "fig-quadmin39"))

Ta = 10
T = [39.1262; 30.5367; 25.4514; 19.6129; 15.6515; 14.4767; 11.9281; 11.8655; 11.0895; 10.8207]
t = [0.0; 1.0; 2.0; 3.0; 4.0; 5.0; 6.0; 7.0; 8.0; 9.0]
scatter(t, T)
plot!(t->Ta, c=:green, l=:dash)
png(joinpath(@OUTPUT, "fig-quadmin40"))

scatter(t, T .- Ta, yaxis=:log)
png(joinpath(@OUTPUT, "fig-quadmin40"))

A = [ones(10) t]
α = (A'*A)\(A'*log.(T .- Ta))
scatter(t, log.(T .- Ta), c=:blue)
plot!(t, α[1] .+ α[2] * t, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin41"))

scatter(t, T, ms=3)
plot!(t->Ta + exp.(α[1] + α[2] * t), c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin42"))

x = t
y = T .- Ta

scatter(x, log.(y), ms=3)
png(joinpath(@OUTPUT, "fig-quadmin43"))

scatter(x, 1 ./ y, ms=3) # Ruim
png(joinpath(@OUTPUT, "fig-quadmin44"))

x = sort(rand(500)*3 .+ 1)
y = 2.1*x.^(5.5) .* (1 .+ rand(500)*0.5)
scatter(x, y, ms=3)
png(joinpath(@OUTPUT, "fig-quadmin45"))

