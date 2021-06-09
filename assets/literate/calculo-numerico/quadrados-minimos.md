<!--This file was generated, do not modify it.-->
# Quadrados Mínimos e Ajustes de Curvas

```julia:ex1
using Plots
gr(size=(600,400))
```

O problema de ajuste de um conjunto de dados à um modelo, simplesmente dito ajuste de curvas, é um problema bastante prático e recorrente.
Esse problema acontece quando temos muito mais informação que o necessário para se determinar exatamente um modelo. Mas isso também só faz sentido se essa informação tiver
algum tipo de erro experimental ou intrínseco.

Considere o seguinte problema de ajustar um conjunto de pontos por uma reta.

```julia:ex2
x = [-2, -1, 0, 1, 2.0]
y = [4, 1, -3, 2, 3.0]
scatter(x, y)
png(joinpath(@OUTPUT, "fig-quadmin01"))
```

\cfig{fig-quadmin01.png}

```julia:ex3
β₀, β₁, β₂ = -62/70, -1/10, 80/70
scatter(x, y)
plot!(x -> β₀ + β₁ * x + β₂ * x^2, -2, 2, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin02"))
```

\cfig{fig-quadmin02.png}

```julia:ex4
m = 100
x = range(-3, 7, length=m)
y = 1.9 .+ 0.6*x + randn(m)*0.3
scatter(x, y, leg=false, c=:lightblue, ms=4)
plot!(x -> 0.58x + 1.92, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin03"))
```

\cfig{fig-quadmin03.png}

```julia:ex5
E(α,β) = 0.5 * sum((y[i] - α - β * x[i])^2 for i = 1:m)
contour(range(1, 3, length=100),
        range(0.0, 1.0, length=100),
        E,
        levels = 100)
png(joinpath(@OUTPUT, "fig-quadmin04"))
```

\cfig{fig-quadmin04.png}

```julia:ex6
M11 = m
M12 = M21 = sum(x)
M22 = sum(x.^2)
c1 = sum(y)
c2 = sum(x .* y)

M = [M11 M12; M21 M22]
c = [c1; c2]
αβ = M \ c

α, β = αβ[1], αβ[2]
```

```julia:ex7
E(α,β) = 0.5 * sum((y[i] - α - β * x[i])^2 for i = 1:m)
contour(range(1, 3, length=100),
        range(0.0, 1.0, length=100),
        E,
        levels = 50)
scatter!([α], [β], c=:red, ms=3)
png(joinpath(@OUTPUT, "fig-quadmin05"))
```

\cfig{fig-quadmin05.png}

```julia:ex8
scatter(x, y, leg=false, c=:lightblue, ms=4)
plot!(x -> α + β * x, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin06"))
```

\cfig{fig-quadmin06.png}

Não existe uma reta que passa por todos esses pontos. Inclusive, alguns deles podem ter o mesmo $x$,
de modo que não existe nenhum função que passa por eles.
Sendo assim, precisamos encontrar uma reta que aproxima estes pontos.

Essa reta é definida por $L(x) = \alpha + \beta x$, e precisamos encontrar esses valores para $\alpha$ e $\beta$.

Uma estratégia é considerar o erro de aproximação e tentar minimizá-lo.
Vamos separar o erro termo a termo, obtendo assim um Erro$_i$, que depende
dos valores de $\alpha$ e $\beta$.

Nosso problema pode ser escrito como
$$ \min E(\alpha,\beta) = \sum_{i=1}^m \text{Erro}_i(\alpha,\beta). $$

Já sabemos que para minimizar uma função, devemos buscar seus pontos críticos.
Isto é,
$$ \frac{\partial E}{\partial \alpha} = 0, $$
e
$$ \frac{\partial E}{\partial \beta} = 0. $$

Para calcular essa derivada, devemos calcular a derivada de Erro$_i$.
Então, a escolha dessa função de erro deve ser bem pensada, para que seja
significativa e fácil de derivar.

A escolha mais comum é Erro$_i = \frac{1}{2}[\alpha + \beta x_i - y_i]^2 = \frac{1}{2}[L(x_i) - y_i]^2$.

Essa escolha é boa pois a derivada dessa função é fácil de calcular, e é fácil de visualizar que é o quadrado da distância vertical da reta ao ponto $(x_i,y_i)$.

```julia:ex9
E(0,0)
```

```julia:ex10
scatter(x, y, leg=false)
plot!(x->0 + 0*x, x[1], x[m], c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin07"))
```

\cfig{fig-quadmin07.png}

```julia:ex11
E(2,0)
```

```julia:ex12
scatter(x, y, leg=false)
plot!(x->2 + 0*x, x[1], x[m], c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin08"))
```

\cfig{fig-quadmin08.png}

```julia:ex13
E(2,0.5)
```

```julia:ex14
scatter(x, y, leg=false)
plot!(x->2 + 0.5*x, x[1], x[m], c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin09"))
```

\cfig{fig-quadmin09.png}
É fácil ver que

$$ \partial_{\alpha} E(\alpha,\beta) = \sum_{i=1}^m (\alpha + \beta x_i - y_i), $$
e
$$ \partial_{\beta} E(\alpha,\beta) = \sum_{i=1}^m x_i (\alpha + \beta x_i - y_i). $$

Como nosso objetivo é encontrar $\alpha$ e $\beta$ tal que essas duas equações sejam zero, obtemos um sistema em $\alpha$ e $\beta$:

\begin{align}
\alpha \bigg(\sum_{i=1}^m 1\bigg) + \beta\bigg(\sum_{i=1}^m x_i\bigg) & = \sum_{i=1}^m y_i \\
\alpha \bigg(\sum_{i=1}^m x_i\bigg) + \beta\bigg(\sum_{i=1}^m x_i^2\bigg) & = \sum_{i=1}^m x_i y_i
\end{align}

Esse sistema é bastante fácil de resolver.

Lembrando

```julia:ex15
using LinearAlgebra
dot(x, y)
```

```julia:ex16
M = [m  sum(x); sum(x)   dot(x,x)]
```

```julia:ex17
b = [sum(y); dot(x,y)]
```

```julia:ex18
α, β = M\b
```

```julia:ex19
E(α,β)
```

```julia:ex20
scatter(x, y, leg=false)
plot!(x->α + β*x, x[1], x[m], c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin10"))
```

\cfig{fig-quadmin10}

Visualmente, a reta parece aproximar bem mesmo os pontos dados.

Um problema levemente diferente, mas parecido é o seguinte: todos os dias por um ano uma pessoa anota a temperatura média do dia.

```julia:ex21
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
```

\cfig{fig-quadmin11}

```julia:ex22
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
```

\cfig{fig-quadmin12}

Seu objetivo é estimar a temperatura em um dia no futuro. Olhando para o gráfico, aparentemente a temperatura segue um modelo do tipo
$$
T(t) = \alpha + \beta \sin(2\pi t) + \gamma \cos(2\pi t).
$$
Note que o intervalo foi normalizado para $t \in [0,1]$.

Se $T_i$ é o valor medido no instante $t_i = \dfrac{i-1}{364}$, então definimos o erro como
$$ E(\alpha,\beta,\gamma) =
    \frac{1}{2}\sum_{i=1}^m [T(t_i) - T_i]^2. $$

Novamente, para minimizar esse erro, calcularemos as derivadas parciais e igualaremos a zero.
Note que apesar de $T$ ser uma função não linear em $t$, ela é linear em $\alpha$, $\beta$ e $\gamma$.

\begin{align}
\partial_{\alpha} E(\alpha,\beta,\gamma)
& = \sum_{i = 1}^m [T(t_i) - T_i] = 0 \\
\partial_{\beta} E(\alpha,\beta,\gamma)
& = \sum_{i = 1}^m [T(t_i) - T_i] \sin(2\pi t_i) = 0 \\
\partial_{\gamma} E(\alpha,\beta,\gamma)
& = \sum_{i = 1}^m[T(t_i) - T_i] \cos(2\pi t_i) = 0.
\end{align}

\begin{align}
\alpha \bigg(\sum_{i=1}^m 1\bigg) +
\beta  \bigg(\sum_{i=1}^m \sin(2\pi t_i)\bigg) +
\gamma \bigg(\sum_{i=1}^m \cos(2\pi t_i)\bigg)
& = \sum_{i=1}^m T_i \\
\alpha \bigg(\sum_{i=1}^m \sin(2\pi t_i)\bigg) +
\beta  \bigg(\sum_{i=1}^m \sin^2(2\pi t_i)\bigg) +
\gamma \bigg(\sum_{i=1}^m \sin(2\pi t_i)\cos(2\pi t_i)\bigg)
& = \sum_{i=1}^m T_i \sin(2\pi t_i) \\
\alpha \bigg(\sum_{i=1}^m \cos(2\pi t_i)\bigg) +
\beta  \bigg(\sum_{i=1}^m \sin(2\pi t_i)\cos(2\pi t_i)\bigg) +
\gamma \bigg(\sum_{i=1}^m \cos^2(2\pi t_i)\bigg)
& = \sum_{i=1}^m T_i \cos(2\pi t_i).
\end{align}

Note que podemos facilitar a maneira de escrever esse sistema definindo os seguintes vetores
$$
v^{(1)} = \left(\begin{array}{c}
1 \\
1 \\
\vdots \\
1
\end{array}\right),
\quad
v^{(2)} = \left(\begin{array}{c}
\sin(2\pi t_1) \\
\sin(2\pi t_2) \\
\vdots \\
\sin(2\pi t_{365})
\end{array}\right),
\quad
v^{(3)} = \left(\begin{array}{c}
\cos(2\pi t_1) \\
\cos(2\pi t_2) \\
\vdots \\
\cos(2\pi t_{365})
\end{array}\right),
\quad
b = \left(\begin{array}{c}
T_1 \\
T_2 \\
\vdots \\
T_{365}
\end{array}\right).
$$

Daí, a matriz do sistema é
$$\left[\begin{array}{ccc}
\left\langle v^{(1)}, v^{(1)} \right\rangle &
\left\langle v^{(1)}, v^{(2)} \right\rangle &
\left\langle v^{(1)}, v^{(3)} \right\rangle \\
\left\langle v^{(2)}, v^{(1)} \right\rangle &
\left\langle v^{(2)}, v^{(2)} \right\rangle &
\left\langle v^{(2)}, v^{(3)} \right\rangle \\
\left\langle v^{(3)}, v^{(1)} \right\rangle &
\left\langle v^{(3)}, v^{(2)} \right\rangle &
\left\langle v^{(3)}, v^{(3)} \right\rangle
\end{array}\right],$$
e o vetor do lado direito é
$$\left[\begin{array}{c}
\left\langle v^{(1)}, b \right\rangle \\
\left\langle v^{(2)}, b \right\rangle \\
\left\langle v^{(3)}, b \right\rangle
\end{array}\right].$$

```julia:ex23
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
```

\cfig{fig-quadmin13}

Vimos como adaptar um conjunto de dados por alguns modelos específicos.
De uma maneira geral, podemos considerar um modelo da forma
$$ f(x) = \alpha_1 \phi_1(x) + \dots + \alpha_n \phi_n(x), $$
e fazer o mesmo procedimento.

Esse problema com esse modelo é dito **quadrados mínimos lineares discretos.**

Para encontrar os parâmetros $\alpha$ fazemos o mesmo procedimento anterior:
$$ \min E(\alpha) = \frac{1}{2} \sum_{i=1}^m [y_i - f(x_i)]^2
= \frac{1}{2} \sum_{i=1}^m \bigg[y_i - \sum_{j=1}^n \alpha_j\phi_j(x_i)\bigg]^2. $$

Derivando em cada $\alpha_k$ nos dá um sistema $M\alpha = c$, onde
$$ M_{kj} = \sum_{i=1}^m \phi_k(x_i)\phi_j(x_i) \qquad \text{e}
\qquad c_j = \sum_{i=1}^m \phi_j(x_i) y_i. $$

Dados a função $\phi_j$ e os pontos $x_i$, podemos definir um vetor $\overline{\phi}_j = (\phi_j(x_1), \dots, \phi_j(x_m))^T$, isto é, o vetor obtido aplicando $\phi_j$ em cada elemento $x_i$.
Com essa definição, podemos escrever
$$ M_{k,j} = \langle\overline{\phi}_k,\overline{\phi}_j\rangle \qquad \text{e} \qquad
c_j = \langle\overline{\phi}_j, y\rangle. $$

O sistema $M\alpha = c$ é chamado de **sistema normal**.

A medida de qualidade para cada dado individual é dada pelo **resíduo**:
$$ r = \left[\begin{array}{c}
y_1 - f(x_1) \\
y_2 - f(x_2) \\
\vdots \\
y_m - f(x_m)
\end{array}\right] $$

O erro pode ser escrito como $E(\alpha) = \frac{1}{2}\Vert r\Vert^2$.

```julia:ex24
x = [0.0; 1; 2; 3; 4]
y = [-1.0; 1; 1; 3; 5]
scatter(x, y, leg=false)
png(joinpath(@OUTPUT, "fig-quadmin14"))
```

\cfig{fig-quadmin14}

```julia:ex25
A = [ones(5)  x  x.^2]
```

```julia:ex26
A' * A
```

```julia:ex27
A' * y
```

```julia:ex28
β = (A' * A) \ (A' * y)
```

```julia:ex29
n = 1000
x = range(-2, 3, length=n)
y = exp.(-x) .* x + randn(n)
scatter(x, y)
png(joinpath(@OUTPUT, "fig-quadmin15"))
```

\cfig{fig-quadmin15}

```julia:ex30
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
```

\cfig{fig-quadmin16}

```julia:ex31
scatter(x, y, leg=false)
plot!(x -> β[1] + β[2] * x + β[3] * x^2, -0.5, 4.5, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin17"))
```

\cfig{fig-quadmin17}

```julia:ex32
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
```

```julia:ex33
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
```

\cfig{fig-quadmin18}

```julia:ex34
data = readdlm("dados.csv", ',')
x, y = data[:,1], data[:,2]
α, β = regressao_linear(x, y)
scatter(x, y, leg=false)
plot!(x -> α + β * x, lw=2, c=:red)
png(joinpath(@OUTPUT, "fig-quadmin19"))
```

\cfig{fig-quadmin19}

```julia:ex35
function quadmin(x, y, F::Array{Function})
    #Implemente
end

F = [x->1, x->sin(2π*x), x->cos(2π*x), x->sin(4π*x), x->cos(4π*x), x->sin(6π*x), x->cos(6π*x)]
n = length(F)
```

Mesmos t e b do exemplo anterior

```julia:ex36
α = quadmin(t, b, F)
scatter(t, b, leg=false, ms=3, c=:lightblue)
#plot!(t->α[1]*F[1](t) + α[2]*F[2](t) + α[3]*F[3](t), 0, 1, c=:red, lw=2)
plot!(t -> sum(α[j]*F[j](t) for j = 1:n), 0, 1, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin20"))
```

\cfig{fig-quadmin20}
Podemos escrever essa combinação de uma maneira resumida

```julia:ex37
f(t) = sum(α[i] * F[i](t) for i = 1:3)

scatter(t, b, leg=false)
plot!(f, 0, 1, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin21"))
```

\cfig{fig-quadmin21}
## Avaliando o modelo

```julia:ex38
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
```

\cfig{fig-quadmin22}

A avaliação de um modelo...

### Regressão Polinomial - Implementação

```julia:ex39
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
```

###  $R^2$

Vamos voltar para o problema inicial de ajustar dados por uma reta: $(x_i, y_i), i = 1,\dots,m$.
Vamos chamar a solução encontrada de $\hat{y} = a x + b$, isto é $\hat{y}_i = a x_i + b \approx y_i$.

O método de Quadrados Mínimos encontrou o menor valor possível para $\displaystyle \sum_{i=1}^m(\hat{y}_i - y_i)^2$, porém não é uma métrica suficiente de qualidade. Vamos definir $$S_r = \displaystyle \sum_{i=1}^m(\hat{y}_i - y_i)^2.$$

Por outro lado, vamos considerar a variação da média dos dados $y_i$:
$$ S_T = \sum_{i=1}^m(y_i - y_{Med})^2,$$
onde $\displaystyle y_{Med} = \frac{1}{m} \sum_{i=1} y_i$ é a média dos dados $y_i$.

Veja que $S_T$ pode ser visto como o erro do modelo constante igual à $y_{Med}$.

```julia:ex40
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
```

\cfig{fig-quadmin23}

```julia:ex41
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
```

\cfig{fig-quadmin24}

A métrica $R^2$ é definida pela fórmula
$$ R^2 = 1 - \frac{S_r}{S_T}. $$

Quanto mais próximo de $1$, melhor o modelo.

```julia:ex42
R2 = 1 - norm(y_pred - y)^2 / norm(y_med .- y)^2
```

Para um modelo não ótimo:

```julia:ex43
y_nao_otimo = 1.9 .+ 0.6*x # Escolhido sabiamente

scatter(x, y, leg=false)
plot!(x, y_nao_otimo, c=:blue)
for i = 1:m
    plot!([x[i], x[i]], [y[i], y_nao_otimo[i]], c=:red, l=:dash)
end
title!("y_nao_otimo")
png(joinpath(@OUTPUT, "fig-quadmin25"))
```

\cfig{fig-quadmin25}

```julia:ex44
R2 = 1 - norm(y_nao_otimo - y)^2 / norm(y_med .- y)^2
```

### Exemplo polinomial

```julia:ex45
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
```

\cfig{fig-quadmin26}

```julia:ex46
ST = norm(y .- y_med)^2
Sr_quase = norm(y - y_quase)^2
Sr_pred = norm(y - y_pred)^2
R2_quase = 1 - Sr_quase / ST
R2_pred = 1 - Sr_pred / ST
println("R2_quase = $R2_quase")
println("R2_pred = $R2_pred")
```

## Validação Cruzada

Outra questão do ajuste é que se ele generaliza bem o problema. Podemos ajustar um conjunto de dados com $x$ distintos por um polinômio de grau suficientemente grande e obter uma solução perfeita:

```julia:ex47
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
```

\cfig{fig-quadmin27}

```julia:ex48
p = 1
β = regressao_polinomial(x, y, p)
xlin = range(extrema(x)..., length=100)
y_pred = [β[1] + sum(β[j + 1] * xi^j for j = 1:p) for xi = xlin]
scatter(x, y, leg=false)
plot!(xlin, y_pred, c=:red, lw=2)
#ylims!(4.9, 8.1)
png(joinpath(@OUTPUT, "fig-quadmin28"))
```

\cfig{fig-quadmin28}

```julia:ex49
y_med = mean(y)
y_pred = [β[1] .+ sum(β[j + 1] * x[i].^j for j = 1:p) for i = 1:m]
ST = norm(y .- y_med)^2
Sr_pred = norm(y - y_pred)^2
R2_pred = 1 - Sr_pred / ST
```

```julia:ex50
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
```

\cfig{fig-quadmin29}

**Dados além dos conhecidos**

```julia:ex51
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
```

\cfig{fig-quadmin30}

### Validação Cruzada - Separação em treino e teste

Separamos uma porcentagem dos dados para treinar o modelo e encontrar os parâmetros, e avaliamos o modelo sobre os dados restantes.

```julia:ex52
Random.seed!(0)
m = 40
#x = sort(rand(m))
x = range(0, 1, length=m)
#y = 5 + 3x - 2x.^2 + randn(m) * 0.05
y = 6 .- 3 * sin.(2π * x) + 7 * cos.(2π * x) + randn(m) * 1.5
scatter(x, y, leg=false)
png(joinpath(@OUTPUT, "fig-quadmin31"))
```

\cfig{fig-quadmin31}

```julia:ex53
Random.seed!(0)
I = randperm(m)
x, y = x[I], y[I]
k = round(Int, 0.6m)
x_tr, y_tr, x_te, y_te = x[1:k], y[1:k], x[k+1:end], y[k+1:end]

p = 6
β = regressao_polinomial(x_tr, y_tr, p) # Apenas o conjunto de treino é usado
y_pred = [β[1] + sum(β[j + 1] * xi^j for j = 1:p) for xi = x_te]
erro = 0.5 * norm(y_te - y_pred)^2
```

```julia:ex54
scatter(leg=false)
scatter!(x_tr, y_tr, c=:blue)
plot!(x -> β[1] + sum(β[j + 1] * x^j for j = 1:p), 0, 1.0, c=:green, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin32"))
```

\cfig{fig-quadmin32}

```julia:ex55
scatter(leg=false)
scatter!(x_te, y_te, c=:red)
plot!(x -> β[1] + sum(β[j + 1] * x^j for j = 1:p), 0, 1.0, c=:green, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin33"))
```

\cfig{fig-quadmin33}

```julia:ex56
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
```

\cfig{fig-quadmin34}

# Um pouco mais sobre a visão estatística

Suponha uma relação real $y = \beta_0 + \beta_1 x + \epsilon$ onde $\epsilon$ é um erro do tipo normal.

```julia:ex57
β = [3.0; 5.0]
σ = 2.7
plot(x -> β[1] + β[2] * x, -2, 3, c=:black, lw=2, leg=false)
```

uma amostra

```julia:ex58
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
```

\cfig{fig-quadmin35}

```julia:ex59
scatter(x, y - yhat, c=:gray)
png(joinpath(@OUTPUT, "fig-quadmin36"))
```

\cfig{fig-quadmin36}

```julia:ex60
scatter(x * 0, y - yhat, c=:gray)
png(joinpath(@OUTPUT, "fig-quadmin37"))
```

\cfig{fig-quadmin37}

```julia:ex61
histogram(x, y - yhat, bins=20)
png(joinpath(@OUTPUT, "fig-quadmin38"))
```

\cfig{fig-quadmin38}

100 amostras

```julia:ex62
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
```

\cfig{fig-quadmin39}

## Forma matricial

Com os vetores $\overline{\phi}_1, \dots, \overline{\phi}$, podemos montar a matriz
$$ A = [\overline{\phi}_1 \cdots \overline{\phi}_n]. $$
Com essa matriz, podemos ver que $ A^TA = M$ e que $A^Ty = c$.
Ou seja, o sistema que queremos resolver é, na verdade
$$ A^TA\alpha = A^Tb, $$
ou seja, $A^T(A\alpha - b) = 0$.

Isso quer dizer que o sistema normal tem alguma relação com o sistema sobre-determinado $A\alpha = b$.
De fato, se pensarmos novamente no problema de minimizar aquela $E(\alpha)$, cada termo dentro do somatório é
uma linha de $A\alpha - b$.
Em outras palavras,
$$ E(\alpha) = \frac{1}{2}\sum_{i=1}^m (b - A\alpha)_i^2
= \frac{1}{2}\Vert A\alpha - b\Vert^2. $$

De fato, se calculamos $\nabla E(\alpha) = 0$, obtemos as equações normais.
Isso generaliza o problema de quadrados mínimos.
Esse problema aparece com frequência em outros contextos, e é bastante importante sabermos resolvê-lo eficientemente. Infelizmente, nesta disciplina, não teremos tempo de aprender como fazer isso de maneira eficiente.

Note ainda que o resíduo é $r = b - Ax$.

# Quadrados Mínimos Não-Lineares

Até agora supomos que o conjunto de dados $(x_i,y_i), i=1,\dots,m$
pode ser representado por uma função
$$f(x) = \alpha_1\phi_1(x) + \dots + \alpha_n\phi_n(x),$$
onde $\alpha$ são as incógnitas que buscamos.

No entanto, isso nem sempre é possível. Muitas vezes não temos uma forma para $f$, sabemos
apenas que depende de $\alpha$.

Um exemplo importante é o da lei de resfriamento. Se um objeto é deixado num ambiente com temperatura $T_a$, ocorrendo apenas troca de temperatura com o ambiente, o objeto pode ter sua temperatura modelada por
$$ T(t) = T_a + \alpha_1 e^{\alpha_2 t}, $$
onde sabemos que $\alpha_2 < 0$ pois $T(t) \rightarrow T_a$ quando $t \to \infty$.

Exemplo

```julia:ex63
Ta = 10
T = [39.1262; 30.5367; 25.4514; 19.6129; 15.6515; 14.4767; 11.9281; 11.8655; 11.0895; 10.8207]
t = [0.0; 1.0; 2.0; 3.0; 4.0; 5.0; 6.0; 7.0; 8.0; 9.0]
scatter(t, T)
plot!(t->Ta, c=:green, l=:dash)
png(joinpath(@OUTPUT, "fig-quadmin40"))
```

\cfig{fig-quadmin40}

De uma maneira geral, podemos considerar um modelo $\Phi(\alpha,x) = \alpha_1 \phi_1(x) + \dots + \alpha_n \phi_n(x)$ e considerar a minimização de
$$E(\alpha) = \sum_{i=1}^m [y_i - \Phi(\alpha,x_i)]^2.$$
No entanto, esse problema é bem mais complicado que o que vimos aqui.

Felizmente, alguns casos podem ser **linearizados**.

## Quadrados Mínimos Não-Lineares Linearizável

Note o seguinte gráfico.

```julia:ex64
scatter(t, T .- Ta, yaxis=:log)
png(joinpath(@OUTPUT, "fig-quadmin40"))
```

\cfig{fig-quadmin40}

Ou seja, embora os dados $(t_i,T_i)$ não possam ser aproximados por uma reta, os dados $(t_i,\ln (T_i - T_a))$ podem.

```julia:ex65
A = [ones(10) t]
α = (A'*A)\(A'*log.(T .- Ta))
scatter(t, log.(T .- Ta), c=:blue)
plot!(t, α[1] .+ α[2] * t, c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin41"))
```

\cfig{fig-quadmin41}
Desse modo, estamos aproximando $\ln(T_i - T_a) \approx \alpha_1 + \alpha_2 t_i$, de modo que
$$T(t) \approx T_a + e^{\alpha_1 + \alpha_2 t_i}  = T_a + \beta_1 e^{\alpha_2 t_i}, $$
onde $\beta_1 = e^{\alpha_1}$.

Mas se $\alpha_1 + \alpha_2 x_i \approx \log y_i$, então $y_i \approx e^{\alpha_1 + \alpha_2 x_i}$.

```julia:ex66
scatter(t, T, ms=3)
plot!(t->Ta + exp.(α[1] + α[2] * t), c=:red, lw=2)
png(joinpath(@OUTPUT, "fig-quadmin42"))
```

\cfig{fig-quadmin42}
De fato, esse modelo parece ajustar muito bem os dados.

Alguns dos modelos que podem ser linearizados estão abaixo:
$$ f(x) = \alpha_1e^{\alpha_2 x} $$
$$ f(x) = \frac{1}{\alpha_1 + \alpha_2 x} $$
$$ f(x) = \alpha_1 x^{\alpha_2} $$

Por exemplo, no primeiro caso $f(x) = \alpha_1e^{\alpha_x 2}$, se $y_i \approx f(x_i)$,
então $\ln y_i \approx \ln f(x_i)$.
Mas
$$ \ln f(x) = \ln \alpha_1 + \alpha_2 x. $$

Isso quer dizer que $g(x) = \beta_1 + \beta_2 x$ é um modelo linear para
$(x_i,\ln y_i), i=1,\dots,m$.
Podemos resolver o problema com o que já foi implementado, por exemplo, e
depois obter $\alpha_1 = e^{\beta_1}$ e $\alpha_2 = \beta_2$.

No caso $f(x) = \alpha_1x^{\alpha_2}$, a transformação também é $\ln f(x)$, obtendo
$$ \ln f(x) = \ln \alpha_1 + \alpha_2\ln x, $$
e aí $g(x) = \beta_1 + \beta_2\ln x$ é um modelo para $(x_i,\ln y_i)$, ou
$h(x) = \beta_1 + \beta_2x$ é um modelo polinomial para $(\ln x_i,\ln y_i)$.

No caso $f(x) = \dfrac{1}{\alpha_1 + \alpha_2 x}$, a transformação é $\dfrac{1}{f(x)}$.

A pergunta nesses casos é, tendo os dados, como saber qual a linearização?
Nesses casos, uma alternativa é tentar os gráficos das modificações.
Além disso, algumas coisas proíbem alguns modelos. Em particular, se $x$ é negativo, então $\log(x)$ é proibido. Se $y$ é negativo, então $\log(y)$ é negativo.

```julia:ex67
x = t
y = T .- Ta
```

Dados anteriores, do tipo αeᵝˣ

```julia:ex68
scatter(x, log.(y), ms=3)
png(joinpath(@OUTPUT, "fig-quadmin43"))
```

\cfig{fig-quadmin43}

```julia:ex69
scatter(x, 1 ./ y, ms=3) # Ruim
png(joinpath(@OUTPUT, "fig-quadmin44"))
```

\cfig{fig-quadmin44}

```julia:ex70
x = sort(rand(500)*3 .+ 1)
y = 2.1*x.^(5.5) .* (1 .+ rand(500)*0.5)
scatter(x, y, ms=3)
png(joinpath(@OUTPUT, "fig-quadmin45"))
```

\cfig{fig-quadmin45}

## Álgebra linear do problema de quadrados mínimos

Como vimos, estamos minimizando $\Vert Ax -b \Vert$. Isso pode ser visto como $\min \Vert y -x\Vert$ para $y \in Im(A)$. Ou seja, estamos calculando a projeção de $b$ na imagem de $A$.

Se $b = y + z$, com $y \in Im(A)$, então $z \perp Im(A)$. Mas, $Im(A)^{\perp} = Nu(A^T)$, de modo que $z \in Nu(A^T)$. Em outras palavras, $A^Tz = 0$. Como $y \in Im(A)$, então existe $u$ tal que $y = Au$. Daí, temos
$b = Au + z$ com $A^Tz = 0$.
Sendo assim,
$$\Vert Ax - b\Vert^2
= \Vert Ax - Au - z\Vert^2
= \Vert A(x - u) - z\Vert^2
= \Vert A(x - u)\Vert^2 + \Vert z\Vert^2,
$$
onde a última igualdade segue de ortogonalidade.
Portanto, a escolha que minimiza $\Vert Ax - b\Vert$, é $x = u$, já que $\Vert z\Vert$ não pode ser modificado pela escolha de $x$. Nisso, temos
$$r = b - Ax = Au + z - Au = z,$$
isto é, $r$ é a projeção ortogonal de $b$ no núcleo de $A^T$.

Note que, apesar de intepretação da projeção ortogonal, a solução $x$ é o coeficiente dos vetores que gera a projeção.

## Exercícios

- Faça os exercícios do capítulo 6 do livro Cálculo Numérico de Ruggiero e Lopes.

- Mostre que a matriz $A^TA$ tem inversa se as colunas de $A$ forem linearmente independentes. Dica: Mostre que $\mathcal{N}(A) = \mathcal{N}(A^TA)$.

- Modele os dados abaixo,
   - Utilizando o modelo $\varphi(x) = \alpha_1 + \alpha_2 \sin(2\pi t) + \alpha_3 \cos(2\pi t)$;
   - Utilizando o modelo $\varphi(x) = \alpha_1 + \alpha_2 \sin(2\pi t) + \alpha_3 \cos(2\pi t) + \alpha_4 \sin(4\pi t) + \alpha_5 \cos(4\pi t)$;
   - Compare os dois ajustes.

| $x$ | 0.000 | 0.125 | 0.250 |  0.375 |  0.500 | 0.625 | 0.750 | 0.875 | 1.000 |
|-|
| $y$ | 7.500 | 6.200 | 2.700 | -0.800 | -0.500 | 1.600 | 4.100 | 6.500 | 7.200 |

- [Nesta página](https://pt.wikipedia.org/wiki/Predefini%C3%A7%C3%A3o:Tabela_clim%C3%A1tica_de_Curitiba) encontram-se as temperaturas médias de Curitiba de vários anos. Ajuste esses dados.

- O problema de quadrados mínimos $\min \frac{1}{2}\Vert Ax - b\Vert^2$ pode ser visualizado como a projeção ortogonal de $b$ na imagem de $A$.
  - O que acontece se $b$ está na imagem de $A$?
  - O que acontece se $b$ é ortogonal à imagem de $A$?
  - Qual seria o problema de quadrados mínimos para se encontrar a projeção ortogonal de $b$ na imagem de $A^T$?
  - Como $Im(A)$ é um subespaço, podemos escrever $b$ como a soma de um elemento de $Im(A)$ e um elemento ortogonal à $Im(A)$. Mostre quem é a solução e o resíduo do problema de quadrados mínimos em função dessa separação d

- Usando quadrados mínimos, encontre a projeção ortogonal de um vetor $v$ sobre outro vetor $w$.
- O que acontece se a matriz $A$ tiver colunas ortogonais?
- O que acontece se a matriz $A$ não tiver colunas linearmente independentes?

