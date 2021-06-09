<!--This file was generated, do not modify it.-->
  # Linguagem de Programação Matemática - Introdução à Julia

  Julia é uma linguagem dinâmica de alto nível e alto desempenho. Ela se
  assemelha ao MatLab e ao Python na facilidade de escrita de código, mas sua
  velocidade pode ser comparável ao C e Fortran.

  Jupyter
  =========

  O Jupyter é uma interface web para Julia, Python, e muitas outras. Ela não é
  o Julia, isto é, o Julia não depende do Jupyter para funcionar. No entanto,
  usando o Jupyter, aulas e apresentações ficam mais práticas.

  Cada célula do Jupyter pode ser executada com um ctrl+enter, ou um
  shift+enter, sendo que o último move a seleção para a célula de baixo. Você
  pode adicionar novas células usando o + no topo da página.

  O REPL - Terminal Interativo
  ==============================

  Ao abrir o Julia no Windows, ou digitar julia no terminal do Mac ou Linux,
  se abrirá um prompt tipo

  ```julia-repl
  julia>
  ```


  O Jupyter também serve como esse prompt e todo comando digitado aqui pode
  ser digitado lá.

  ## Editor: VSCode
  A fazer...

  Jupyter vs Editor
  ===================

  O Jupyter é utilizado para aulas, apresentações, workshops. A parte
  importante é a interatividade.

  O editor é usado para fazer códigos sérios. Para desenvolver os exercícios,
  projetos, e futuros pacotes, é necessário criar arquivos e ter um ambiente
  adequado.

  Os exercícios e projetos devem ser feitos num editor e serão avaliados sem o
  uso do Jupyter.

  # Introdução à Julia

```julia:ex1
using Random # hide
Random.seed!(0) # hide
```

  # Básico

```julia:ex2
2 + 3 + 5 + 7 + 11
```

```julia:ex3
3 * 5
```

```julia:ex4
7 ^ 3
```

```julia:ex5
exp(-1) * exp(1)
```

```julia:ex6
( sin(3.14159/4) * 2 )^2
```

```julia:ex7
pi
```

```julia:ex8
( sin(pi/4) * 2 )^2
```

```julia:ex9
round(1.2)
```

```julia:ex10
abs(-3)
```

```julia:ex11
log(2)
```

```julia:ex12
log10(2) + log10(5)
```

```julia:ex13
log2(2)
```

```julia:ex14
x = 3
```

```julia:ex15
x ^ 2
```

```julia:ex16
y = 2x
```

```julia:ex17
y
```

```julia:ex18
y - x
```

```julia:ex19
1e-2 # 10⁻²
```

```julia:ex20
1e3 # 10³
```

```julia:ex21
3.45e2
```

```julia:ex22
0.1 + 0.2 - 0.3
```

  **Exercício**

  Sabendo que sqrt é a função que calcula a raiz quadrada, calcule $ \dfrac{1
  + \sqrt{5}}{2}. $

~~~
<div class="solucao">
<a class="btn btn-primary" data-bs-toggle="collapse" href="#ex1" role="button" aria-expanded="false" aria-controls="ex1">
Solução
</a>
<div class="collapse" id="ex1">
<div class="card card-body">
~~~

```julia:ex23
(1 + sqrt(5)) / 2
```

~~~
</div></div></div>
~~~

  # Álgebra Linear Numérica

```julia:ex24
[1 2; 3 4]
```

```julia:ex25
[4.0 3; 2 1]
```

```julia:ex26
[2.0 3.0 4.0 5.0]
```

```julia:ex27
rand(3)
```

```julia:ex28
rand(2, 3)
```

```julia:ex29
ones(3)
```

```julia:ex30
zeros(3)
```

```julia:ex31
rand(2,4)
```

```julia:ex32
v = rand(3)
```

```julia:ex33
A = rand(2, 3)
```

```julia:ex34
A * v
```

```julia:ex35
w = rand(2)
```

```julia:ex36
A' * w
```

```julia:ex37
A' * A
```

```julia:ex38
B = rand(2, 3)
```

```julia:ex39
A + B
```

```julia:ex40
A * B'
```

```julia:ex41
A' * B
```

```julia:ex42
A = rand(3, 3)
b = rand(3)
x = A \ b # Resolve o SL
```

```julia:ex43
inv(A) * b
```

```julia:ex44
A * x - b # É pra ser zero (ou quase)
```

```julia:ex45
using LinearAlgebra

norm(A * x - b) # norm = ‖ ⋅ ‖
```

```julia:ex46
v = [1.0; 2.0; 3.0]
w = [2.0; -2.0; 2.0]
dot(v, w) # ⟨v,w⟩
```

```julia:ex47
v * w'
```

```julia:ex48
cross(v, w)
```

```julia:ex49
det(A)
```

```julia:ex50
A^2 # A * A
```

```julia:ex51
A .^ 2 # Cada elemento de A ao quadrado
```

```julia:ex52
B = rand(3, 3)
```

```julia:ex53
A .* B
```

```julia:ex54
v
```

```julia:ex55
w
```

```julia:ex56
v .^ w
```

  Funções que normalmente seriam aplicadas a um único elemento podem ser
  aplicadas a vetores e matrizes utilizando o .

```julia:ex57
log(2)
```

```julia:ex58
log.(A)
```

```julia:ex59
exp(A) # Significa outra coisa
```

```julia:ex60
exp.(A) # Elemento a elemento
```

```julia:ex61
A + 10I
```

```julia:ex62
A .+ 1
```

```julia:ex63
m, n = size(A)
```

```julia:ex64
length(v)
```

```julia:ex65
size(v)
```

```julia:ex66
length(A)
```

  Exercício

  1. Crie uma matriz A 50 por 50 aleatório, e defina b como o produto dessa
       matriz pelo vetor composta apenas de uns (1).
  2. Resolva o sistema Ax = b com a matriz A e o vetor b acima, e verifique
       que a solução é o vetor de uns.

~~~
<div class="solucao">
<a class="btn btn-primary" data-bs-toggle="collapse" href="#ex2" role="button" aria-expanded="false" aria-controls="ex2">
Solução
</a>
<div class="collapse" id="ex2">
<div class="card card-body">
~~~
**Q1:**

```julia:ex67
A = rand(50, 50)
b = A * ones(50);
```

**Q2:**

```julia:ex68
x = A \ b
norm(x .- 1)
```

~~~
</div></div></div>
~~~

  Acesso aos elementos
  ======================

```julia:ex69
v
```

```julia:ex70
v[1]
```

```julia:ex71
v[2]
```

```julia:ex72
A = rand(3, 3)
```

```julia:ex73
A[1,1]
```

```julia:ex74
A[2,3]
```

```julia:ex75
v[1:2]
```

```julia:ex76
A[:,2]
```

```julia:ex77
A[1,:]
```

```julia:ex78
A[2,3] = 0.0
```

```julia:ex79
A
```

  Exercício

    1. Crie um vetor aleatório e mude o primeiro elemento para o seu oposto
       (i.e. mude o sinal)

~~~
<div class="solucao">
<a class="btn btn-primary" data-bs-toggle="collapse" href="#ex2" role="button" aria-expanded="false" aria-controls="ex2">
Solução
</a>
<div class="collapse" id="ex2">
<div class="card card-body">
~~~

```julia:ex80
v = rand(5)
v[1] = -v[1]
```

~~~
</div></div></div>
~~~

  Matriz por blocos - Concatenação
  ==================================

```julia:ex81
A = rand(3, 3)
```

```julia:ex82
B = rand(3, 2)
```

```julia:ex83
[A B] # Mesma linha
```

```julia:ex84
[A A A]
```

```julia:ex85
[A; B'] # Mesma coluna
```

```julia:ex86
[A, B] # NÃO É CONCATENAÇÃO
```

```julia:ex87
[A B; B' zeros(2,2)]
```

```julia:ex88
[A I]
```

```julia:ex89
[A; I]
```

  # Funções

  Existem três maneiras de definir uma função. Uma básica, quase matemática:

```julia:ex90
f(x) = x * exp(-x)
f(2)
```

```julia:ex91
f(-3)
```

```julia:ex92
f(sqrt(2))
```

```julia:ex93
g(a,b) = exp(a + b)
```

```julia:ex94
g(2,3)
```

```julia:ex95
exp(5)
```

```julia:ex96
g(3,-3)
```

  Uma maneira anônima

```julia:ex97
2
```

```julia:ex98
x -> sin(x) * x
```

```julia:ex99
(x -> sin(x) * x)(pi/4)
```

  Que podemos atribuir a uma variável

```julia:ex100
h = x -> sin(x) * x
```

```julia:ex101
h(pi/4)
```

  A última usa `function` e `end` para definir uma função com nome e definição
  extensa (o jeito tradicional). É o jeito mais descritivo, apesar de ser o
  mais longo.

```julia:ex102
function media(a, b)
    return (a + b) / 2
end
```

```julia:ex103
media(7, 4)
```

```julia:ex104
function reverte(a, b)
    return b, a
end
```

```julia:ex105
reverte(5, 3)
```

```julia:ex106
function aproxima_derivada(f, a, h)
    Δf = f(a + h) - f(a)
    return Δf / h
end
```

```julia:ex107
aproxima_derivada(exp, 1.0, 1e-6)
```

```julia:ex108
s(x) = sin(x)
```

```julia:ex109
aproxima_derivada(s, pi/6, 1e-8)
```

```julia:ex110
sqrt(3) / 2
```

```julia:ex111
aproxima_derivada(x->x^2 + 3x + 2, 2, 1e-4)
```

  Além dos argumentos obrigatórios de uma função, também podemos adicionar
  argumentos posicionais opcionais, e argumentos por palavra chave.

```julia:ex112
#Aqui p é opcional
function potencia(x, p=1)
    return x^p
end
```

```julia:ex113
potencia(2)
```

```julia:ex114
potencia(2, 2)
```

```julia:ex115
potencia(2, 10)
```

```julia:ex116
potencia(2.0, 10)
```

```julia:ex117
A = rand(2,2)
```

```julia:ex118
potencia(A, 4)
```

```julia:ex119
potencia.(A, 10)

#Aqui, p1 e p2 são opcionais por palavra-chave
function media(a, b; p1 = 1.0, p2 = 1.0)
    return (a * p1 + b * p2) / (p1 + p2)
end
```

```julia:ex120
media(2.0, 5.0)
```

```julia:ex121
media(2.0, 5.0, p1=2)
```

```julia:ex122
media(2.0, 5.0, p2=3)
```

```julia:ex123
media(2.0, 5.0, p1=2, p2=3)
```

  Exercícios

  1. Crie um vetor com os ângulos importantes: $0$, $\frac{\pi}{6}$, $\frac{\pi}{4}$, $\frac{\pi}{3}$ e $\frac{\pi}{2}$.
  2. Crie um vetor com o seno de cada ângulo e outro com o cosseno, usando o vetor acima.
  3. Calcule a tangente de cada angulo usando os dois vetores acima (`tan = sen/cos`)
  4. Crie uma função que recebe uma matriz $A$ e um vetor $v$ e retorna
  $$\dfrac{\langle v, Av\rangle}{\langle v, v\rangle}.$$
  5. Teste com a matriz $$\begin{bmatrix} 6 & 1 \\ 1 & 4\end{bmatrix}.$$ e o vetor de uns.

~~~
<div class="solucao">
<a class="btn btn-primary" data-bs-toggle="collapse" href="#ex2" role="button" aria-expanded="false" aria-controls="ex2">
Solução
</a>
<div class="collapse" id="ex2">
<div class="card card-body">
~~~

```julia:ex124
θ = [0.0; π / 6; π / 4; π / 3; π / 2]
seno, cosseno = sin.(θ), cos.(θ)
tangente = seno ./ cosseno
```

```julia:ex125
[seno cosseno]
```

```julia:ex126
1 / 0
```

```julia:ex127
function rayleigh(A, v)
    return dot(v, A * v) / dot(v, v)
end
```

```julia:ex128
A = [6 1; 1 4]
v = ones(2)
rayleigh(A, v)
```

```julia:ex129
v = rand(2)
rayleigh(A, v)
```

~~~
</div></div></div>
~~~

  # Loops e condicionais

  Quase todas as linguagens de programação usam loops e condicionais, sendo os
  principais:

  - `for`, que itera sobre um conjunto finito de elementos;
  - `if`, que verifica uma condição e executa partes de códigos diferentes
    dependendo do resultado;
  - `while`, que repete comandos até encontrar uma condição;

  A ideia é a mesma em todas as linguagens, mas a sintaxe muda.

```julia:ex130
1:5
```

```julia:ex131
collect(1:5)
```

```julia:ex132
collect(1:2:5)
```

```julia:ex133
collect(0.0:0.1:1.0)
```

```julia:ex134
collect(range(0, 1, length=11))
```

```julia:ex135
range(0, stop=1, step=0.5)
```

```julia:ex136
collect(10:-1:1)
```

```julia:ex137
for i = 2.0:0.5:3.0
    println(i^2) # Impressão e quebra linha
end
```

```julia:ex138
for i = 1:10
    print(i, " ")
end
```

```julia:ex139
for i = 1:10
    println("i = $i")
end
```

```julia:ex140
using Printf
```

```julia:ex141
for i = 1:10
    @printf("i = %010.4e\n", i / 7) # Notação de C
end
```

```julia:ex142
x = rand(10)
y = zeros(10)
for i = 1:10
    y[i] = x[i] * i
end
```

```julia:ex143
[x y]
```

```julia:ex144
y ./ x
```

```julia:ex145
for x in [0; pi/6; pi/4; pi/3; pi/2]
    println("sin($x) = $(sin(x))")
end
```

```julia:ex146
for i = 3:3:20
    print("$i ")
end
```

```julia:ex147
for i in 3:2:10
    println("$i^2 = $(i^2)")
end
```

  Tipos importam
  ================

  Todos objetos em Julia tem um tipo. Assim como números podem ser reais,
  inteiros, etc, um número em Julia pode ser Real, Integer, ou tipos ainda
  mais específicos, como Float64, Int64, ComplexF64, Rational, etc.

  Além disso, funções tem tipo Function, vetores e matrizes têm tipos também,
  texto tem tipo String, onde String originalmente se referente à cadeia de
  caracteres, e Char é o tipo para caractere.

  Tipos têm hierarquia, e tipo mais geral é Any.

```julia:ex148
[2; 3]
```

```julia:ex149
Float64[2; 3]
```

```julia:ex150
for x in Any["a", 'b', 0, 3.14, true, MathConstants.e, 3//4, im, ones(2), ones(2,2)]
    println("x: $x    Tipo: $(typeof(x))")
end
```

```julia:ex151
n = 6
v = ones(n)
v[n/2] = 2 #Erro esperado
```

```julia:ex152
n/2
```

```julia:ex153
div(n,2)
```

```julia:ex154
div(7, 2)
```

```julia:ex155
round(Int, n/2)
```

```julia:ex156
10 % 4 # Resto da divisão de 10 por 4
```

  Fatorial: $ n! = n(n-1)\dots2. 1 $

```julia:ex157
function fatorial(n)
    resultado = 1
    for i = 1:n
        resultado = resultado * i
    end
    return resultado
end
```

```julia:ex158
fatorial(4)
```

```julia:ex159
fatorial(5)
```

```julia:ex160
fatorial(0)
```

```julia:ex161
fatorial(4.3) # Nossa implementação não "liga" pra .3
```

```julia:ex162
fatorial(-2) # Nossa implementação
```

```julia:ex163
function fatorial2(n :: Int)
    resultado = 1
    for i = 1:n
        resultado = resultado * i
    end
    return resultado
end
```

```julia:ex164
fatorial2(5)
```

```julia:ex165
fatorial2(3.4)
```

sinal:
$$\text{sinal}(x) = \left\{\begin{array}{rl}
  1, & x > 0 \\
 -1, & x < 0 \\
  0, & x = 0.
 \end{array}\right.$$

```julia:ex166
function sinal(x)
    if x > 0
        return 1
    elseif x < 0
        return -1
    else
        return 0
    end
end
```

```julia:ex167
sinal(3.2)
```

```julia:ex168
sinal(-1.2)
```

```julia:ex169
sinal(0.0)
```

  Bháskara: $$ax^2 + bx + c = 0$$ e $$b^2 - 4ac \geq 0$$ implicam em : $$x = \dfrac{-b
  \pm \sqrt{b^2 - 4ac}}{2a}.$$

```julia:ex170
function bhaskara(a, b, c)
    Δ = b^2 - 4 * a * c
    if Δ < 0
        error("Nos reais não tem solução")
    end
    return (-b + sqrt(Δ)) / 2a, (-b - sqrt(Δ)) / 2a
end
```

```julia:ex171
bhaskara(1, 0, -1)
```

```julia:ex172
bhaskara(1, 0, 1)
```

```julia:ex173
bhaskara(1.0, 5.0, 6.0)
```

```julia:ex174
bhaskara(0, 1, 1)
```

```julia:ex175
Inf / Inf
```

```julia:ex176
(NaN * 2 - Inf - NaN) / NaN
```

  Maior potência de 2 menor ou igual que um número

```julia:ex177
function maior_pot(x)
    p = 1
    while p <= x
        p = 2p
    end
    p = div(p, 2)
    return p
end
```

```julia:ex178
maior_pot(2)
```

```julia:ex179
maior_pot(10)
```

```julia:ex180
maior_pot(100)
```

```julia:ex181
for n = [1, 10, 100, 1000, 10000, 100000, 1000000]
    p = maior_pot(n)
    println("2ᵏ = p ≤ n, n = $n, p = $p")
end
```

  MMC: $\text{mmc}(a, b)$ é o menor número natural que é múltiplo de a e de b.

  Operadores lógicos:

  or  → ||
  and → &&
  <>  → !=
  =   → == (Pascal) Comparação

```julia:ex182
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
```

```julia:ex183
mmc(2,3)
```

```julia:ex184
mmc(5, 7)
```

```julia:ex185
mmc(6, 8)
```

```julia:ex186
mmc(12, 14)
```

```julia:ex187
mmc(3, 5)
```

```julia:ex188
mmc(-1, 2)
```

```julia:ex189
mmc(2.0, 3.0)
```

  Exercícios

  1. Atualize a função fatorial para proibir números negativos não
       inteiros. Proíba também o fatorial de um número maior que 20.
  2. Atualize a função de Bháskara para que retorne um erro caso a seja 0.
  3. Faça uma função que recebe um inteiro n e verifica se ele é primo.

~~~
<div class="solucao">
<a class="btn btn-primary" data-bs-toggle="collapse" href="#ex1" role="button" aria-expanded="false" aria-controls="ex1">
Solução
</a>
<div class="collapse" id="ex1">
<div class="card card-body">
~~~

```julia:ex190
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
```

```julia:ex191
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
```

```julia:ex192
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
```

~~~
</div></div></div>
~~~

  Arquivos
  ==========

  Quando trabalhamos com mais de um arquivo, o que deve acontecer logo,
  precisamos incluir um arquivo no outro para obter as informações relevantes.

  Além disso, se quisermos rodar as informações do arquivo direto no terminal
  do Julia, também podemos incluir o arquivo direto do terminal do Julia.

  Use:

  ```julia
  include("arquivo.jl")
  ```

  para incluir um arquivo e rodar todo seu conteúdo.

  O arquivo precisa estar na mesma pasta do outro arquivo ou do terminal.

  Pacotes
  =========

  O Julia não vem com tudo pré-instalado, assim como a maioria das linguagem
  de programação. Para encontrar um pacote que faça o que você quer, você pode
  buscar na lista http://pkg.julialang.org/ ou no Google. Os pacotes que
  usaremos aqui estarão disponíveis no LAMIND.

  Instalação de pacotes
  –––––––––––––––––––––––

  No Julia, aperte ] para entrar no modo pkg>. Use add Pacote para adicionar o
  pacote com nome Pacote.

  Principais pacotes:

  - Pacote Plots: comandos unificados de fazer gráficos.
  - Pacote PyPlot: para desenhar gráficos usando o matplotlib. Bonito, mas
       lento e demorado de instalar.
  - Pacote GR: outro pacote para desenhar gráficos. Mais rápido, mas menos
       bonito.
  - Pacote Primes: pacote para trabalhar com números primos.
  - Pacote Combinatorics: pacote para funções de combinátoria.

  Plots
  =======

  Utilizaremos os pacotes Plots e GR para fazer nossos gráficos.

  Para o help dos gráficos, veja Julia Plots (https://juliaplots.github.io).

```julia:ex193
using Plots
gr(size=(600,400))
plot([1; 2; 3], [3; 1; 2]) # plot(x, y)
png(joinpath(@OUTPUT, "plt-ex1")) # hide
```

\cfig{plt-ex1.png}

```julia:ex194
x = range(0, 1, length=100) # 100 elementos igual. esp. de 0 a 1
y = x.^2
plot(x, y)
png(joinpath(@OUTPUT, "plt-ex2")) # hide
```

\cfig{plt-ex2.png}

```julia:ex195
scatter(x, x .* (1 .- x) * 4)
png(joinpath(@OUTPUT, "plt-ex3")) # hide
```

\cfig{plt-ex3.png}

```julia:ex196
scatter(x, rand(100))
png(joinpath(@OUTPUT, "plt-ex4")) # hide
```

\cfig{plt-ex4.png}

```julia:ex197
f(x) = x * sin(x)
plot(f, 0, 4pi) # plot(f, a, b)
png(joinpath(@OUTPUT, "plt-ex5")) # hide
```

\cfig{plt-ex5.png}

```julia:ex198
plot(x->exp(x) * x, -1, 1)
plot!(x->exp(-x), -1, 1)
xlims!(-0.5, 0.5)
ylims!(0.5, 1.5)
png(joinpath(@OUTPUT, "plt-ex6")) # hide
```

\cfig{plt-ex6.png}

```julia:ex199
t = range(-2, stop=3, length=200)
x = cos.(t*pi*2) .* exp.(t)
y = sin.(t*pi*2) .* exp.(t)
plot(x, y)
xlims!(-20, 30)
ylims!(-30, 20)
png(joinpath(@OUTPUT, "plt-ex7")) # hide
```

\cfig{plt-ex7.png}

```julia:ex200
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
```

\cfig{plt-ex8.png}

```julia:ex201
x = range(0, stop=2*pi, length=100)
anim = Animation()
for i = 1:5:100
    plot(x[1:i], sin.(x[1:i]))
    frame(anim)
end
gif(anim, joinpath(@OUTPUT, "exemplo-1.gif"), fps=12) # hide
```

\fig{exemplo-1.gif}

```julia:ex202
x = range(0, stop=2*pi, length=100)
anim = Animation()
for i = 1:3:100
    plot(x[1:i], sin.(x[1:i]))
    xlims!(x[1], x[end])
    ylims!(-1, 1)
    frame(anim)
end
gif(anim, joinpath(@OUTPUT, "exemplo-2.gif"), fps=12) # hide
```

\fig{exemplo-2.gif}

```julia:ex203
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
```

\fig{exemplo-3.gif}

```julia:ex204
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
```

\fig{exemplo-4.gif}

  Imagens 3d (ou de objetos 3d)

  As principais ferramentas são o contour para curvas de nível e surface e
  wireframe para superfícies.

```julia:ex205
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
```

\cfig{plt-3d1.png}

```julia:ex206
f(x,y) = (y - 0.5) / (x^2 + 1)
layout = grid(2, 2)
plt = plot(layout = layout)
contour!(plt[1], X, Y, f)
surface!(plt[2], X, Y, f)
wireframe!(plt[3], X, Y, f)
surface!(plt[4], X, Y, f, camera=(60, 60))
png(joinpath(@OUTPUT, "plt-3d2")) # hide
```

\cfig{plt-3d2.png}

```julia:ex207
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
```

\fig{exemplo-5.gif}

  Exercícios
  ============

  1. Crie um vetor x aleatório, e crie y = 2x + 3. Crie um plot e depois um
       scatter de x vs y.
  2. Faça o gráfico de e^x no intervalo [-1,1] em vermelho.
  3. Faça no mesmo gráfico os gráficos de 1, 1+x e 1+x+0.5x^2 em azul, com
       linha pontilhada.

~~~
<div class="solucao">
<a class="btn btn-primary" data-bs-toggle="collapse" href="#ex1" role="button" aria-expanded="false" aria-controls="ex1">
Solução
</a>
<div class="collapse" id="ex1">
<div class="card card-body">
~~~

```julia:ex208
x = rand(100)
y = 2x .+ 3
plot(x, y)
scatter!(x, y)
```

```julia:ex209
plot(x -> exp(x), -1, 1, c=:red)
plot!(x -> 1, -1, 1, c=:blue, l=:dash)
plot!(x -> 1 + x, -1, 1, c=:blue, l=:dash)
plot!(x -> 1 + x + 0.5x^2, -1, 1, c=:blue, l=:dash)
```

~~~
</div></div></div>
~~~

