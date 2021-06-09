#   # Linguagem de Programação Matemática - Introdução à Julia
#
#   Julia é uma linguagem dinâmica de alto nível e alto desempenho. Ela se
#   assemelha ao MatLab e ao Python na facilidade de escrita de código, mas sua
#   velocidade pode ser comparável ao C e Fortran.

#   Jupyter
#   =========
#
#   O Jupyter é uma interface web para Julia, Python, e muitas outras. Ela não é
#   o Julia, isto é, o Julia não depende do Jupyter para funcionar. No entanto,
#   usando o Jupyter, aulas e apresentações ficam mais práticas.
#
#   Cada célula do Jupyter pode ser executada com um ctrl+enter, ou um
#   shift+enter, sendo que o último move a seleção para a célula de baixo. Você
#   pode adicionar novas células usando o + no topo da página.

#   O REPL - Terminal Interativo
#   ==============================
#
#   Ao abrir o Julia no Windows, ou digitar julia no terminal do Mac ou Linux,
#   se abrirá um prompt tipo
#
#   ```julia-repl
#   julia>
#   ```
#
#
#   O Jupyter também serve como esse prompt e todo comando digitado aqui pode
#   ser digitado lá.

#   ## Editor: VSCode
#   A fazer...

#   Jupyter vs Editor
#   ===================
#
#   O Jupyter é utilizado para aulas, apresentações, workshops. A parte
#   importante é a interatividade.
#
#   O editor é usado para fazer códigos sérios. Para desenvolver os exercícios,
#   projetos, e futuros pacotes, é necessário criar arquivos e ter um ambiente
#   adequado.
#
#   Os exercícios e projetos devem ser feitos num editor e serão avaliados sem o
#   uso do Jupyter.

#   # Introdução à Julia

using Random # hide
Random.seed!(0) # hide

#   # Básico

2 + 3 + 5 + 7 + 11
#
3 * 5
#
7 ^ 3
#
exp(-1) * exp(1)
#
( sin(3.14159/4) * 2 )^2
#
pi
#
( sin(pi/4) * 2 )^2
#
round(1.2)
#
abs(-3)
#
log(2)
#
log10(2) + log10(5)
#
log2(2)
#
x = 3
#
x ^ 2
#
y = 2x
#
y
#
y - x
#
1e-2 # 10⁻²
#
1e3 # 10³
#
3.45e2
#
0.1 + 0.2 - 0.3

#   **Exercício**
#
#   Sabendo que sqrt é a função que calcula a raiz quadrada, calcule $ \dfrac{1
#   + \sqrt{5}}{2}. $

#=
~~~
<div class="solucao">
<a class="btn btn-primary" data-bs-toggle="collapse" href="#ex1" role="button" aria-expanded="false" aria-controls="ex1">
Solução
</a>
<div class="collapse" id="ex1">
<div class="card card-body">
~~~
=#
(1 + sqrt(5)) / 2
#=
~~~
</div></div></div>
~~~
=#

#   # Álgebra Linear Numérica

[1 2; 3 4]
#
[4.0 3; 2 1]
#
[2.0 3.0 4.0 5.0]
#
rand(3)
#
rand(2, 3)
#
ones(3)
#
zeros(3)
#
rand(2,4)
#
v = rand(3)
#
A = rand(2, 3)
#
A * v
#
w = rand(2)
#
A' * w
#
A' * A
#
B = rand(2, 3)
#
A + B
#
A * B'
#
A' * B
#
A = rand(3, 3)
b = rand(3)
x = A \ b # Resolve o SL
#
inv(A) * b
#
A * x - b # É pra ser zero (ou quase)
#
using LinearAlgebra

norm(A * x - b) # norm = ‖ ⋅ ‖
#
v = [1.0; 2.0; 3.0]
w = [2.0; -2.0; 2.0]
dot(v, w) # ⟨v,w⟩
#
v * w'
#
cross(v, w)
#
det(A)
#
A^2 # A * A
#
A .^ 2 # Cada elemento de A ao quadrado
#
B = rand(3, 3)
#
A .* B
#
v
#
w
#
v .^ w

#   Funções que normalmente seriam aplicadas a um único elemento podem ser
#   aplicadas a vetores e matrizes utilizando o .

log(2)
#
log.(A)
#
exp(A) # Significa outra coisa
#
exp.(A) # Elemento a elemento
#
A + 10I
#
A .+ 1
#
m, n = size(A)
#
length(v)
#
size(v)
#
length(A)

#   Exercício
#
#   1. Crie uma matriz A 50 por 50 aleatório, e defina b como o produto dessa
#        matriz pelo vetor composta apenas de uns (1).
#   2. Resolva o sistema Ax = b com a matriz A e o vetor b acima, e verifique
#        que a solução é o vetor de uns.

#=
~~~
<div class="solucao">
<a class="btn btn-primary" data-bs-toggle="collapse" href="#ex2" role="button" aria-expanded="false" aria-controls="ex2">
Solução
</a>
<div class="collapse" id="ex2">
<div class="card card-body">
~~~
**Q1:**
=#
A = rand(50, 50)
b = A * ones(50);
# **Q2:**
x = A \ b
norm(x .- 1)
#=
~~~
</div></div></div>
~~~
=#

#   Acesso aos elementos
#   ======================

v
#
v[1]
#
v[2]
#
A = rand(3, 3)
#
A[1,1]
#
A[2,3]
#
v[1:2]
#
A[:,2]
#
A[1,:]
#
A[2,3] = 0.0
#
A

#   Exercício
#
#     1. Crie um vetor aleatório e mude o primeiro elemento para o seu oposto
#        (i.e. mude o sinal)

#=
~~~
<div class="solucao">
<a class="btn btn-primary" data-bs-toggle="collapse" href="#ex2" role="button" aria-expanded="false" aria-controls="ex2">
Solução
</a>
<div class="collapse" id="ex2">
<div class="card card-body">
~~~
=#
v = rand(5)
v[1] = -v[1]
#=
~~~
</div></div></div>
~~~
=#

#   Matriz por blocos - Concatenação
#   ==================================

A = rand(3, 3)
#
B = rand(3, 2)
#
[A B] # Mesma linha
#
[A A A]
#
[A; B'] # Mesma coluna
#
[A, B] # NÃO É CONCATENAÇÃO
#
[A B; B' zeros(2,2)]
#
[A I]
#
[A; I]

#   # Funções

#   Existem três maneiras de definir uma função. Uma básica, quase matemática:

f(x) = x * exp(-x)
f(2)
#
f(-3)
#
f(sqrt(2))
#
g(a,b) = exp(a + b)
#
g(2,3)
#
exp(5)
#
g(3,-3)

#   Uma maneira anônima

2
#
x -> sin(x) * x
#
(x -> sin(x) * x)(pi/4)

#   Que podemos atribuir a uma variável

h = x -> sin(x) * x
#
h(pi/4)

#   A última usa `function` e `end` para definir uma função com nome e definição
#   extensa (o jeito tradicional). É o jeito mais descritivo, apesar de ser o
#   mais longo.

function media(a, b)
    return (a + b) / 2
end
#
media(7, 4)
#
function reverte(a, b)
    return b, a
end
#
reverte(5, 3)
#
function aproxima_derivada(f, a, h)
    Δf = f(a + h) - f(a)
    return Δf / h
end
#
aproxima_derivada(exp, 1.0, 1e-6)
#
s(x) = sin(x)
#
aproxima_derivada(s, pi/6, 1e-8)
#
sqrt(3) / 2
#
aproxima_derivada(x->x^2 + 3x + 2, 2, 1e-4)

#   Além dos argumentos obrigatórios de uma função, também podemos adicionar
#   argumentos posicionais opcionais, e argumentos por palavra chave.

#Aqui p é opcional
function potencia(x, p=1)
    return x^p
end
#
potencia(2)
#
potencia(2, 2)
#
potencia(2, 10)
#
potencia(2.0, 10)
#
A = rand(2,2)
#
potencia(A, 4)
#
potencia.(A, 10)

#Aqui, p1 e p2 são opcionais por palavra-chave
function media(a, b; p1 = 1.0, p2 = 1.0)
    return (a * p1 + b * p2) / (p1 + p2)
end
#
media(2.0, 5.0)
#
media(2.0, 5.0, p1=2)
#
media(2.0, 5.0, p2=3)
#
media(2.0, 5.0, p1=2, p2=3)

#   Exercícios

#   1. Crie um vetor com os ângulos importantes: $0$, $\frac{\pi}{6}$, $\frac{\pi}{4}$, $\frac{\pi}{3}$ e $\frac{\pi}{2}$.
#   2. Crie um vetor com o seno de cada ângulo e outro com o cosseno, usando o vetor acima.
#   3. Calcule a tangente de cada angulo usando os dois vetores acima (`tan = sen/cos`)
#   4. Crie uma função que recebe uma matriz $A$ e um vetor $v$ e retorna
#   $$\dfrac{\langle v, Av\rangle}{\langle v, v\rangle}.$$
#   5. Teste com a matriz $$\begin{bmatrix} 6 & 1 \\ 1 & 4\end{bmatrix}.$$ e o vetor de uns.

#=
~~~
<div class="solucao">
<a class="btn btn-primary" data-bs-toggle="collapse" href="#ex2" role="button" aria-expanded="false" aria-controls="ex2">
Solução
</a>
<div class="collapse" id="ex2">
<div class="card card-body">
~~~
=#
θ = [0.0; π / 6; π / 4; π / 3; π / 2]
seno, cosseno = sin.(θ), cos.(θ)
tangente = seno ./ cosseno
#
[seno cosseno]
#
1 / 0
#
function rayleigh(A, v)
    return dot(v, A * v) / dot(v, v)
end
#
A = [6 1; 1 4]
v = ones(2)
rayleigh(A, v)
#
v = rand(2)
rayleigh(A, v)
#=
~~~
</div></div></div>
~~~
=#


#   # Loops e condicionais

#   Quase todas as linguagens de programação usam loops e condicionais, sendo os
#   principais:
#
#   - `for`, que itera sobre um conjunto finito de elementos;
#   - `if`, que verifica uma condição e executa partes de códigos diferentes
#     dependendo do resultado;
#   - `while`, que repete comandos até encontrar uma condição;
#
#   A ideia é a mesma em todas as linguagens, mas a sintaxe muda.

1:5
#
collect(1:5)
#
collect(1:2:5)
#
collect(0.0:0.1:1.0)
#
collect(range(0, 1, length=11))
#
range(0, stop=1, step=0.5)
#
collect(10:-1:1)
#
for i = 2.0:0.5:3.0
    println(i^2) # Impressão e quebra linha
end
#
for i = 1:10
    print(i, " ")
end
#
for i = 1:10
    println("i = $i")
end
#
using Printf
#
for i = 1:10
    @printf("i = %010.4e\n", i / 7) # Notação de C
end
#
x = rand(10)
y = zeros(10)
for i = 1:10
    y[i] = x[i] * i
end
#
[x y]
#
y ./ x
#
for x in [0; pi/6; pi/4; pi/3; pi/2]
    println("sin($x) = $(sin(x))")
end
#
for i = 3:3:20
    print("$i ")
end
#
for i in 3:2:10
    println("$i^2 = $(i^2)")
end

#   Tipos importam
#   ================

#   Todos objetos em Julia tem um tipo. Assim como números podem ser reais,
#   inteiros, etc, um número em Julia pode ser Real, Integer, ou tipos ainda
#   mais específicos, como Float64, Int64, ComplexF64, Rational, etc.
#
#   Além disso, funções tem tipo Function, vetores e matrizes têm tipos também,
#   texto tem tipo String, onde String originalmente se referente à cadeia de
#   caracteres, e Char é o tipo para caractere.
#
#   Tipos têm hierarquia, e tipo mais geral é Any.

[2; 3]
#
Float64[2; 3]
#
for x in Any["a", 'b', 0, 3.14, true, MathConstants.e, 3//4, im, ones(2), ones(2,2)]
    println("x: $x    Tipo: $(typeof(x))")
end
#
n = 6
v = ones(n)
v[n/2] = 2 #Erro esperado
#
n/2
#
div(n,2)
#
div(7, 2)
#
round(Int, n/2)
#
10 % 4 # Resto da divisão de 10 por 4

#   Fatorial: $ n! = n(n-1)\dots2. 1 $

function fatorial(n)
    resultado = 1
    for i = 1:n
        resultado = resultado * i
    end
    return resultado
end
#
fatorial(4)
#
fatorial(5)
#
fatorial(0)
#
fatorial(4.3) # Nossa implementação não "liga" pra .3
#
fatorial(-2) # Nossa implementação
#
function fatorial2(n :: Int)
    resultado = 1
    for i = 1:n
        resultado = resultado * i
    end
    return resultado
end
#
fatorial2(5)
#
fatorial2(3.4)

#=
sinal:
$$\text{sinal}(x) = \left\{\begin{array}{rl}
  1, & x > 0 \\
 -1, & x < 0 \\
  0, & x = 0.
 \end{array}\right.$$
=#

function sinal(x)
    if x > 0
        return 1
    elseif x < 0
        return -1
    else
        return 0
    end
end
#
sinal(3.2)
#
sinal(-1.2)
#
sinal(0.0)

#   Bháskara: $$ax^2 + bx + c = 0$$ e $$b^2 - 4ac \geq 0$$ implicam em : $$x = \dfrac{-b
#   \pm \sqrt{b^2 - 4ac}}{2a}.$$

function bhaskara(a, b, c)
    Δ = b^2 - 4 * a * c
    if Δ < 0
        error("Nos reais não tem solução")
    end
    return (-b + sqrt(Δ)) / 2a, (-b - sqrt(Δ)) / 2a
end
#
bhaskara(1, 0, -1)
#
bhaskara(1, 0, 1)
#
bhaskara(1.0, 5.0, 6.0)
#
bhaskara(0, 1, 1)
#
Inf / Inf
#
(NaN * 2 - Inf - NaN) / NaN

#   Maior potência de 2 menor ou igual que um número

function maior_pot(x)
    p = 1
    while p <= x
        p = 2p
    end
    p = div(p, 2)
    return p
end
#
maior_pot(2)
#
maior_pot(10)
#
maior_pot(100)
#
for n = [1, 10, 100, 1000, 10000, 100000, 1000000]
    p = maior_pot(n)
    println("2ᵏ = p ≤ n, n = $n, p = $p")
end

#   MMC: $\text{mmc}(a, b)$ é o menor número natural que é múltiplo de a e de b.

#   Operadores lógicos:
#
#   or  → ||
#   and → &&
#   <>  → !=
#   =   → == (Pascal) Comparação
#

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
#
mmc(2,3)
#
mmc(5, 7)
#
mmc(6, 8)
#
mmc(12, 14)
#
mmc(3, 5)
#
mmc(-1, 2)
#
mmc(2.0, 3.0)

#   Exercícios
#
#   1. Atualize a função fatorial para proibir números negativos não
#        inteiros. Proíba também o fatorial de um número maior que 20.
#   2. Atualize a função de Bháskara para que retorne um erro caso a seja 0.
#   3. Faça uma função que recebe um inteiro n e verifica se ele é primo.

#=
~~~
<div class="solucao">
<a class="btn btn-primary" data-bs-toggle="collapse" href="#ex1" role="button" aria-expanded="false" aria-controls="ex1">
Solução
</a>
<div class="collapse" id="ex1">
<div class="card card-body">
~~~
=#
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
#
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
#
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
#=
~~~
</div></div></div>
~~~
=#


#   Arquivos
#   ==========

#   Quando trabalhamos com mais de um arquivo, o que deve acontecer logo,
#   precisamos incluir um arquivo no outro para obter as informações relevantes.
#
#   Além disso, se quisermos rodar as informações do arquivo direto no terminal
#   do Julia, também podemos incluir o arquivo direto do terminal do Julia.

#   Use:
#
#   ```julia
#   include("arquivo.jl")
#   ```
#
#   para incluir um arquivo e rodar todo seu conteúdo.
#
#   O arquivo precisa estar na mesma pasta do outro arquivo ou do terminal.

#   Pacotes
#   =========

#   O Julia não vem com tudo pré-instalado, assim como a maioria das linguagem
#   de programação. Para encontrar um pacote que faça o que você quer, você pode
#   buscar na lista http://pkg.julialang.org/ ou no Google. Os pacotes que
#   usaremos aqui estarão disponíveis no LAMIND.

#   Instalação de pacotes
#   –––––––––––––––––––––––

#   No Julia, aperte ] para entrar no modo pkg>. Use add Pacote para adicionar o
#   pacote com nome Pacote.

#   Principais pacotes:
#
#   - Pacote Plots: comandos unificados de fazer gráficos.
#   - Pacote PyPlot: para desenhar gráficos usando o matplotlib. Bonito, mas
#        lento e demorado de instalar.
#   - Pacote GR: outro pacote para desenhar gráficos. Mais rápido, mas menos
#        bonito.
#   - Pacote Primes: pacote para trabalhar com números primos.
#   - Pacote Combinatorics: pacote para funções de combinátoria.

#   Plots
#   =======

#   Utilizaremos os pacotes Plots e GR para fazer nossos gráficos.
#
#   Para o help dos gráficos, veja Julia Plots (https://juliaplots.github.io).

using Plots
gr(size=(600,400))
plot([1; 2; 3], [3; 1; 2]) # plot(x, y)
png(joinpath(@OUTPUT, "plt-ex1")) # hide

# \cfig{plt-ex1.png}
#
x = range(0, 1, length=100) # 100 elementos igual. esp. de 0 a 1
y = x.^2
plot(x, y)
png(joinpath(@OUTPUT, "plt-ex2")) # hide

# \cfig{plt-ex2.png}
#
scatter(x, x .* (1 .- x) * 4)
png(joinpath(@OUTPUT, "plt-ex3")) # hide

# \cfig{plt-ex3.png}
#
scatter(x, rand(100))
png(joinpath(@OUTPUT, "plt-ex4")) # hide

# \cfig{plt-ex4.png}
#
f(x) = x * sin(x)
plot(f, 0, 4pi) # plot(f, a, b)
png(joinpath(@OUTPUT, "plt-ex5")) # hide

# \cfig{plt-ex5.png}
#
plot(x->exp(x) * x, -1, 1)
plot!(x->exp(-x), -1, 1)
xlims!(-0.5, 0.5)
ylims!(0.5, 1.5)
png(joinpath(@OUTPUT, "plt-ex6")) # hide

# \cfig{plt-ex6.png}

t = range(-2, stop=3, length=200)
x = cos.(t*pi*2) .* exp.(t)
y = sin.(t*pi*2) .* exp.(t)
plot(x, y)
xlims!(-20, 30)
ylims!(-30, 20)
png(joinpath(@OUTPUT, "plt-ex7")) # hide

# \cfig{plt-ex7.png}
#
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

# \cfig{plt-ex8.png}

x = range(0, stop=2*pi, length=100)
anim = Animation()
for i = 1:5:100
    plot(x[1:i], sin.(x[1:i]))
    frame(anim)
end
gif(anim, joinpath(@OUTPUT, "exemplo-1.gif"), fps=12) # hide

# \fig{exemplo-1.gif}
#
x = range(0, stop=2*pi, length=100)
anim = Animation()
for i = 1:3:100
    plot(x[1:i], sin.(x[1:i]))
    xlims!(x[1], x[end])
    ylims!(-1, 1)
    frame(anim)
end
gif(anim, joinpath(@OUTPUT, "exemplo-2.gif"), fps=12) # hide

# \fig{exemplo-2.gif}
#
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

# \fig{exemplo-3.gif}
#
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

# \fig{exemplo-4.gif}
#

#   Imagens 3d (ou de objetos 3d)
#
#   As principais ferramentas são o contour para curvas de nível e surface e
#   wireframe para superfícies.

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

# \cfig{plt-3d1.png}
#
f(x,y) = (y - 0.5) / (x^2 + 1)
layout = grid(2, 2)
plt = plot(layout = layout)
contour!(plt[1], X, Y, f)
surface!(plt[2], X, Y, f)
wireframe!(plt[3], X, Y, f)
surface!(plt[4], X, Y, f, camera=(60, 60))
png(joinpath(@OUTPUT, "plt-3d2")) # hide

# \cfig{plt-3d2.png}
#
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

# \fig{exemplo-5.gif}

#   Exercícios
#   ============
#
#   1. Crie um vetor x aleatório, e crie y = 2x + 3. Crie um plot e depois um
#        scatter de x vs y.
#   2. Faça o gráfico de e^x no intervalo [-1,1] em vermelho.
#   3. Faça no mesmo gráfico os gráficos de 1, 1+x e 1+x+0.5x^2 em azul, com
#        linha pontilhada.

#=
~~~
<div class="solucao">
<a class="btn btn-primary" data-bs-toggle="collapse" href="#ex1" role="button" aria-expanded="false" aria-controls="ex1">
Solução
</a>
<div class="collapse" id="ex1">
<div class="card card-body">
~~~
=#
x = rand(100)
y = 2x .+ 3
plot(x, y)
scatter!(x, y)
#
plot(x -> exp(x), -1, 1, c=:red)
plot!(x -> 1, -1, 1, c=:blue, l=:dash)
plot!(x -> 1 + x, -1, 1, c=:blue, l=:dash)
plot!(x -> 1 + x + 0.5x^2, -1, 1, c=:blue, l=:dash)
#=
~~~
</div></div></div>
~~~
=#
