# This file was generated, do not modify it.

15 % 2

14 % 2

15 % 2 == 0 # É par ?

14 % 2 == 0 # É par ?

div(15, 2)

div(14, 2)

14/2 # 7.0 e 7 são o mesmo valor, mas são diferentes em computação

a1 = 3
if a1 % 2 == 0
    a2 = div(a1, 2)
else
    a2 = 3 * a1 + 1
end

if a2 % 2 == 0
    a3 = div(a2, 2)
else
    a3 = 3 * a2 + 1
end

a = 300

if a % 2 == 0
    a = div(a, 2)
else
    a = 3 * a + 1
end
a

if a % 2 == 0
    a = div(a, 2)
else
    a = 3 * a + 1
end
a

if a % 2 == 0
    a = div(a, 2)
else
    a = 3 * a + 1
end
a

a = 3
n = 1

if a % 2 == 0
    a = div(a, 2)
else
    a = 3 * a + 1
end
n = n + 1
println("a = $a, n = $n")

if a % 2 == 0
    a = div(a, 2)
else
    a = 3 * a + 1
end
n = n + 1
println("a = $a, n = $n")

if a % 2 == 0
    a = div(a, 2)
else
    a = 3 * a + 1
end
n = n + 1
println("a = $a, n = $n")

function collatz(a::Int; a_bound = 10^17, n_bound = 1_000_000) # O mesmo que começar com x e atribuir x à a.
    n = 1
    if a <= 0
        return 0
    end
    while a > 1
        print("$a ")
        if a % 2 == 0
            a = div(a, 2)
        else
            a = 3a + 1
        end
        n += 1
        if a > a_bound
            return -1
        elseif n > n_bound
            return -2
        end
    end
    return n
end

collatz(151)

collatz(2^30, n_bound=10)

collatz(1)

collatz(10^17+2)

function fibon(n::Int)
    if n ≤ 0 #\le
        return 0
    elseif n == 1 || n == 2
        return 1
    end
    F1, F2, k = 1, 1, 2
    while k < n
        F3 = F1 + F2
        F1, F2 = F2, F3
        #F1, F2 = F2, F1 + F2
        k += 1
    end
    return F2
end

for n = 1:20
    println("F_$n = $(fibon(n))")
end

function fat_por_recursao(n::Int)
    if n < 0
        error("BLAH")
    end
    if n == 0
        return 1
    end
    return n * fat_por_recursao(n - 1)
end

fat_por_recursao(5)

fat_por_recursao(21)

5 > 0 ? "ok" : "oops"

fat_uma_linha(n::Int) = n == 0 ? 1 : n * fat_uma_linha(n - 1)

fat_uma_linha(5)

function FIBO(n)
    if n <= 2
        return min(1, max(n, 0)) # Pequeno truque
    else
        return FIBO(n-1) + FIBO(n-2)
    end
end

FIBO(10)

for n = 1:20
    println("F_$n = $(FIBO(n))")
end

F(n) = n <= 2 ? min(1, max(n, 0)) : F(n-1) + F(n-2)

for n = 1:20
    println("F_$n = $(F(n))")
end

function FIBO_comprint(n)
    println("Chamada: F$n")
    if n <= 2
        return min(1, max(n, 0)) # Pequeno truque
    else
        return FIBO_comprint(n-1) + FIBO_comprint(n-2)
    end
end

FIBO_comprint(5)

phi = (1 + sqrt(5))/2
psi = 1 - phi
for n = 1:20
    Fn = round(Int, (phi^n - psi^n)/sqrt(5))
    println("F_$n = $Fn")
end

phi = (1 + sqrt(5))/2
psi = 1 - phi
F1 = F2 = 1
Fnovo = 1
for n = 3:93
    global F1, F2, Fnovo # hide
    Fn = (phi^n - psi^n)/sqrt(5)
    Fnovo = F1 + F2
    F2 = F1
    F1 = Fnovo
    println("F_$n = $Fnovo, Diferença F_$n = $(Fn - Fnovo)")
end

MathConstants.e

E = 1.0
E += 1.0   # k = 1
E += 0.5   # k = 2
E += 1/6   # k = 3
E += 1/24  # k = 4
E += 1/120 # k = 5

MathConstants.e - E

function exponencial(x, n)
    #Exercício. Usa a função factorial(n) para calcular n!
    E = 1.0
    for k = 1:n
        E += x^k / factorial(k)
    end
    return E
end

exponencial(1.0, 20)

MathConstants.e - exponencial(1.0, 20)

abs( exp(2) - exponencial(2.0, 20) ) / exp(2)

abs( exp(3) - exponencial(3.0, 20) ) / exp(3)

abs( exp(10) - exponencial(10.0, 20) ) / exp(10)

abs( exp(3) - exponencial(3.0, 21) ) / exp(3)

using Plots
gr(size=(400,300))

N = collect(1:20)
Erro = [abs(exponencial(1.0, n) - exp(1.0))/exp(1.0) for n in N]
scatter(N, Erro, yaxis=:log)
png(joinpath(@OUTPUT, "plt-exp1")) # hide

N = collect(1:20)
Erro = [abs(exponencial(5.0, n) - exp(5.0))/exp(5.0) for n in N]
scatter(N, Erro, yaxis=:log)
png(joinpath(@OUTPUT, "plt-exp2"))

x = 10.0
n = 60
E = [1.0]
t = 1.0
for k = 1:n
    global t # hide
    t = t * x / k
    push!(E, t)
end
scatter(E, yaxis=:log)
png(joinpath(@OUTPUT, "plt-exp3")) # hide

function exponencial2(x, n)
    #Implemente
    E = 1.0
    t = 1.0
    for k = 1:n
        t *= x / k
        E += t
    end
    return E
end

exponencial2(1.0, 20)

(exponencial2(10.0, 60) - exp(10.0)) / exp(10)

using Plots
N = collect(1:50)
Erro = [abs(exponencial2(1.0, n) - exp(1.0))/exp(1.0) for n in N]
Erro[findall(Erro .== 0.0)] .= eps()
scatter(N, abs.(Erro), yaxis=:log)
png(joinpath(@OUTPUT, "plt-exp4")) # hide

N = collect(1:50)
Erro = [abs(exponencial2(10.0, n) - exp(10.0))/exp(10.0) for n in N]
Erro[findall(Erro .== 0.0)] .= eps()
scatter(N, Erro, yaxis=:log)
ylims!(eps()/2, 1.0)
png(joinpath(@OUTPUT, "plt-exp5")) # hide

function exponencial3(x)
    #Implemente
    E = 1.0
    t = x
    k = 1
    while E + t != E
        E += t
        k += 1
        t *= x / k
    end
    return E
end

plot(x->exp(x) - exponencial3(x), 0, 10.0)
png(joinpath(@OUTPUT, "plt-exp6")) # hide

plot(x->abs(exp(x) - exponencial3(x))/exp(x), 0, 10.0)
png(joinpath(@OUTPUT, "plt-exp7")) # hide

plot(x->abs(exp(x) - exponencial3(x))/exp(x), -10.0, 10.0)
png(joinpath(@OUTPUT, "plt-exp7")) # hide

function exponencial4(x)
    if x < 0
        return 1.0/exponencial4(-x)
    end
    #Implemente
    return exponencial3(x)
end

plot(x->abs(exp(x) - exponencial4(x))/exp(x), -10.0, 10.0)
png(joinpath(@OUTPUT, "plt-exp8")) # hide

function pi_atan()
    S = 1.0
    n = 1
    σ = -1
    t = σ/(2n+1)
    while S + t != S
        S += t
        σ = -σ
        n += 1
        t = σ/(2n+1)
        if n > 1_000_000_000
            break
        end
    end
    return 4S
end

pi_atan()

@time pi_atan() - pi

function pi_madhava()
    S = 1.0
    third = 1.0/3.0
    σ = -1
    pow_third = third
    t = σ * third * third
    n = 1
    while S + t != S
        S += t
        n += 1
        pow_third *= third
        σ = -σ
        t = σ * pow_third / (2n + 1)
    end
    println("n = $n") # Usar para mostrar quantas iterações
    return sqrt(12) * S
end

pi_madhava() - pi

BigFloat(pi)

function pi_madhava_BF()
    S = BigFloat(1.0)
    third = BigFloat(1.0)/BigFloat(3.0)
    σ = -1
    pow_third = third
    t = σ * third * third
    n = 1
    while S + t != S
        S += t
        n += 1
        pow_third *= third
        σ = -σ
        t = σ * pow_third / (2n + 1)
        if n > 1_000_000
            break
        end
    end
    println("n = $n") # Usar para mostrar quantas iterações
    return sqrt(BigFloat(12.0)) * S
end

setprecision(2^10)
pi_madhava_BF() - pi

setprecision(2^11)
round(Int, -log10(eps(BigFloat)))

for n = 10:14
    global E # hide
    setprecision(2^n)

    E = max(abs(pi_madhava_BF() - BigFloat(pi)), eps(BigFloat))
    casas = round(Int, -log10(E))
    println("Com $(2^n) bits obtive $casas casas")
end

setprecision(2^15)
@time pi_madhava_BF();

function logaritmo2()
    ln2 = 1.0 / 2.0
    k = 2
    r = 1 / 4
    while ln2 + r /k != ln2
        ln2 += r / k
        k += 1
        r = r / 2
        if k > 1_000_000
            break
        end
    end
    println("k = $k")
    return ln2
end

logaritmo2() - log(2)

