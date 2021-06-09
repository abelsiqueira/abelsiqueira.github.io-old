<!--This file was generated, do not modify it.-->
# Aritmética de Ponto Flutuante

Os objetivos desta lição são

- Aprender sobre a representação de números naturais e inteiros na máquina;
- Aprender sobre Aritmética de Ponto Flutuante.

## Representação de Inteiros na máquina

Os computadores guardam inteiros de maneiras bastante específicas. Essas
maneiras envolvem os bits de um computador, que matematicamente equivalem a
números binários. Um bit pode estar ligado ou desligado, ou seja, $1$ ou $0$. Um
inteiro de $n$ bits terá $n$ posições ordenadas que podem estar ligadas ou
desligadas. Dessa maneira, é possível representar até $2^n$ inteiros com $n$
bits. A pergunta é quais $2^n$ inteiros?

Muitas vezes nos preocupamos apenas com os inteiros positivos, então uma
escolha bastante simples seria os inteiros de $0$ à $2^n-1$. Esse tipo é dito
"sem sinal" ou "Unsigned" em inglês. Em Julia, são os tipos `UIntN`, onde $N$ é
o número de bits $(8, 16, 32, 64, 128)$.

Para inteiros positivos e negativos, uma maneira é guardar os númeos de
$-2^{n-1}$ à $2^{n-1}-1$. Em binário, podemos escolher os $n-1$ bits da direita
para fazer uma contagem de $0$ à $2^{n-1}-1$, e o bit mais à esquerda para
indicar de começamos a contar de $-2^{n-1}$ ou de $0$.

### Exemplo com n = 3

```
Bin Dec
––– –––
000   0
001   1
010   2
011   3
100  -4
101  -3
110  -2
111  -1
```

Note que o problema de trabalhar com inteiros que caiam fora deste intervalo
está nas operações básicas mesmo:

```
3 + 1 (em decimal)

         1     1
 011    011    011    011
 001    001    001    001
----   ----   ----   ----
   ?      0     00    100
```

Mas $100$ nessa representação significa $-4$, ou seja, a soma "dá a volta".

### Exemplo com n = 64 (o padrão)

O inteiro `Int64` vai de $-2^{63}$ à $2^{63}-1$.

```julia:ex1
x = 2^63-1
```

```julia:ex2
x + 1
```

```julia:ex3
-x
```

```julia:ex4
-x - 2
```

```julia:ex5
-(x+1)  # = x + 1??
```

```julia:ex6
x * x
```

```julia:ex7
y = 2^62
```

```julia:ex8
y * y
```

```julia:ex9
x * y
```

```julia:ex10
(BigInt(2)^63)^2
```

Embora os valores máximos dos inteiros de 64 bits pareçam bastante grandes,
eles podem ser alcançados com relativa facilidade.

```julia:ex11
factorial(20)
```

```julia:ex12
factorial(20) * 21
```

```julia:ex13
factorial(20) * 21 * 22 * 23
```

### BigInt

Apesar do limite dos inteiros, muitas vezes queremos utilizar valores
inteiros absurdamente grandes. Para isso existem implementações de números
inteiros grandes - BigInts, para encurtar - que permitem, a priori, qualquer
número inteiro. É importante notar a diferença entre um BigInt e um inteiro
nativo. O BigInt sempre vem de uma implementação, enquanto que o inteiro
nativo "existe" no processador. Todas as contas com BigInt serão mais lentas
que em inteiros nativos, então não podemos simplesmente usar BigInt para
tudo.

```julia:ex14
factorial(big"21")
```

```julia:ex15
log2(4 * 10^(20))
```

```julia:ex16
log2(4 * BigInt(10)^(20))
```

```julia:ex17
big"2"^300
```

```julia:ex18
factorial(big"30")
```

## Introdução à pontos flutuantes

Nem só de inteiros vive o homem. Vamos falar sobre números de ponto
flutuante na máquina, que é como representamos números reais (spoiler: só um
subconjunto dos racionais, como veremos a seguir).

Um número em ponto flutuante é da forma $\pm 0.\text{mantissa} \times \text{base}^\text{expoente},$ onde a mantissa é uma sequência de dígitos entre $0$ e a base menos $1$.

### Exemplos

$$234 = 0.234 \times 10^3 $$
$$-12.5 = -.125 \times 10^2 $$
$$0.001 = 0.1 \times 10^{-2} $$
$$(101)2 = (0.101)2 \times 2^3. $$

Veja que a notação é muito parecida com a notação científica.

Números em ponto flutuante são armazenados numa quantidade finita de bits -
normalmente, $64$ bits. A base escolhida é a base $2$, e tanto a mantissa quando
o expoente são armazenados nesses $64$ bits. O tipo em Julia que representa
pontos flutuante de $64$ bits é o `Float64`. Também existem o `Float16` e o
`Float32`, que usam $16$ e $32$ bits, respectivamente.

Lembre-se que os números $5$ e $6$ em binário são $101$ e $110$.

```julia:ex19
bitstring(5.0)
```

```julia:ex20
bitstring(6.0)
```

As primeiras casas indicam o expoente, e as últimas indicam a mantissa.

Existem vários detalhes da implementação de ponto flutuante que iremos
deixar de lado. Vamos olhar apenas de uma maneira mais simples a parte
teórica.

Note que teremos limitações para a mantissa e expoente. Em particular, na
base $10$, pensaremos que a mantissa tem uma limitação no número de dígitos
depois da vírgula, e o expoente estará limitada entre valores $L$ e $U$ como $L
\leq E \leq U$. Note que isso implica que existem valores máximos e mínimos.

Por exemplo, com $3$ dígitos na mantissa e um expoente limitado por $-3 \leq E
\leq 4$, o máximo será $ X{\max} = 0.999 \times 10^4 \approx 10^4, $ o
menor número positivo será $ X{\min} = 0.001 \times 10^{-3} = 10^{-6}. $

O conjunto dos números de pontos flutuante não abrange todas as
possibilidades de números que poderiam ser representados com a quantidade de
bits dada. Por exemplo, $0\times 10^n$ ainda é zero, independente do $n$. Sendo
assim, existem várias sequências de bits "livres", que podem ser usados para
representar outras coisas. Em particular, nos pontos flutuantes é possível
representar um valor infinito:

```julia:ex21
Inf
```

```julia:ex22
Inf > 1e300
```

```julia:ex23
1 / Inf
```

```julia:ex24
Inf + Inf
```

e também um valor que indica que a operação realizada contém alguma
incoerência, o NotANumber, ou NaN.

```julia:ex25
NaN
```

```julia:ex26
0 / 0
```

```julia:ex27
Inf - Inf
```

Cuidado: O NaN é contagioso. Se ao programar você encontrar um NaN, você
deve examinar seu código, descobrir o que está causando ele, e evitar esse
problema.

```julia:ex28
NaN + 1
```

```julia:ex29
NaN - NaN
```

```julia:ex30
1 / NaN
```

```julia:ex31
2 > NaN
```

```julia:ex32
2 < NaN
```

```julia:ex33
2 == NaN
```

```julia:ex34
0.0 ^ 0.0
```

```julia:ex35
1.0^Inf
```

```julia:ex36
1.0^NaN
```

```julia:ex37
Inf^NaN
```

```julia:ex38
Inf^(1/Inf)
```

```julia:ex39
1 / (-1 / Inf)
```

### Representação gráfica dos floats

Abaixo, veremos todos os números em ponto flutuante (ou o que dá pra ver).

Para cada ponto em azul, a abscissa corresponde à um ponto flutuante, e
ordenada desse ponto é a distância entre um ponto e o ponto imediatamente
antes dele.

```julia:ex40
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
```

\cfig{fig1.png}

Veja que as distância são as potências de 2.

A base tradicionalmente é $2$ nos computadores, e os bits atribuídos a um
número desses é separado em uma parte para a mantissa e outra para o
expoente. Em particular, com $64$ bits, usamos $53$ dígitos para a mantissa e $11$
para o expoente. Um dos bits da mantissa guarda o sinal do elemento.

Um aspecto essencial dos pontos flutuantes é que eles representam apenas uma
quantidade finita de pontos, e como a quantidade dígitos depois da vírgula
da mantissa também é finita, apenas os racionais podem ser representados.

Mais do que isso, dízimas períodicas são truncadas. Por exemplo, $1/3$ seria
aproximado por $0.66...67$ para alguma quantidade de dígitos $6$.

No entanto, no computador usamos a base $2$, e alguns números que não são
dízimas na base $10$ podem ser dízimas na base $2$. Por exemplo, $0.1$.

Veja que $$S = 1 + \frac{1}{2^4} + \frac{1}{2^8} + \frac{1}{2^{12}} + \dots =
\frac{1}{1 - 2^{-4}} = \frac{16}{15}.$$
Daí, $$\frac{1}{2^4}(S + \tfrac{1}{2}S)
= \frac{1}{16}\times\frac{24}{15} = \frac{1}{10}.$$

Por outro lado, $(S)_2 = 1.0001000100010001\dots$, então
$$\frac{1}{10} =
\frac{1}{2^4}(1.000100010\dots + 0.100010001\dots) =
\frac{1}{2^4}(1.100110011\dots) = 0.000110011001100\dots$$

```julia:ex41
using Printf

@printf("%20.18f\n", 0.1)
```

```julia:ex42
bitstring(0.1)
```

Apesar de não parecer muito, essa pequena diferença levará a erros como o
abaixo:

```julia:ex43
a = (0.1 + 0.2)
b = 0.3
```

```julia:ex44
abs(b - a)
```

```julia:ex45
abs(b - a) / a
```

```julia:ex46
(0.1 + 0.2 - 0.3) * 2^50
```

```julia:ex47
1e-17 * 2^50
```

```julia:ex48
bitstring(0.1 + 0.2)
```

```julia:ex49
bitstring(0.3)
```

## Aritmética de Ponto Flutuante

Além do armazenamento, também é importante definir a aritmética de ponto
flutuante.

Dado dois números armazenados na mesma base, a operação de soma ou subtração
entre os dois ocorre da seguinte forma:

1. Entrada: dois numeros $x_1 = M_1 \times \beta^{E_1}$ e $x_2 = M_2 \times \beta^{E_2}$.
2. Calcule o maior expoente $E = max(E_1, E_2)$
3. Escreva os dois números usando este expoente
  $$ x_1 = (M_1 \times \beta^{E_1 - E}) \times \beta^E $$
  $$ x_2 = (M_2 \times \beta^{E_2 - E}) \times \beta^E $$
4. Some os dois
$$ x_3 = x_1 + x_2 = (M_1 \times \beta^{E_1 - E} + M_2 \times \beta^{E_2 - E}) \times \beta^E $$
5. Calcule a mantissa $M_3$ e expoente $E_3$ do número novo $x_3 = M_3 \times \beta^{E_3}$.

Observe, no entanto, que como a mantissa e o expoente são guardados usando
uma quantidade finita de bits, então podemos acabar perdendo informação.

Vamos fazer uma simulação dessa operação uma mantissa de 3 dígitos além da
vírgula, e um expoente com limitantes $-5 \leq E \leq 4$, na base 10.

```
34.12  +  8.256

3.412 × 10¹ + 8.256 × 10⁰
3.412 × 10¹ + 0.8256 × 10¹
(3.412 + 0.8256) × 10¹
4.2376 × 10¹
4.238 × 10¹  Armazenado
42.38
```

Essa perda de dígitos é chamado de erro de arredondamento.

Em alguns casos, esse erro pode fazer com que um dos números somados seja
tratado como zero.

```
2351 + 0.01234

2.351 × 10³ + 1.234 × 10⁻²
2.351 × 10³ + 0.00001234 × 10³
(2.351 + 0.00001234) × 10³
2.35101234 × 10³
2.351 × 10³  Armazenado
2351
```
=

No armazenamento IEEE754, é um pouco mais complicado chegar nos valores
máximos e mínimos, mas eles ainda existem. Em particular, podemos usar o
código abaixo para calcular qual o menor número positivo que é tratado como
0 quando somado à 1.

```julia:ex50
1.0 + 1e-18
```

```julia:ex51
ϵ = 1.0
while 1.0 + ϵ > 1.0
    global ϵ # hide
    ϵ = ϵ/2
end
ϵ = 2ϵ
```

```julia:ex52
eps(Float64)
```

```julia:ex53
eps(Float16)
```

```julia:ex54
eps(0.3 * 2^50)
```

Esse número é chamado de precisão da máquina, e às vezes denotado por
$\epsilon_{\text{machine}}$. Para todo número real x, existe um número x' em
ponto flutuante tal que $ |x - x'| \leq \epsilon_{\text{machine}}|x|. $

```julia:ex55
eps(0.3)
```

```julia:ex56
0.1 + 0.2 - 0.3
```

```julia:ex57
prevfloat(Inf)
```

```julia:ex58
nextfloat(0.0)
```

A multiplicação é mais simples. Os expoentes são somados, as mantissas
multiplicadas, e os valores são arredondados e ajustados de modo a ficar na
forma de ponto flutuante. Análogo para divisão.

Nos pontos flutuantes de $64$ bits (`Float64` no Julia), o maior valor
representável nessa base é por volta de $10^{308}$ e o menor positivo é
$5\times10^{-324}$. Diferente do que acontece com inteiros, quando fazemos
alguma coisa que ultrapassa o maior valor, nós temos o chamado overflow.
Denotaremos o número como $\infty$ (infinito), ou Inf em Julia. Se algum
cálculo resultar em um valor positivo que o menor valor positivo, obtemos um
chamado underflow, e o valor é considerado $0$.

Denotamos por $\text{fl}(x)$ o número em ponto flutuante mais próximo do real
x. Temos que para cada $x \in \mathbb{R}$, existe $\epsilon$ tal que $|\epsilon|
\leq \epsilon_{\text{machine}}$ e $\text{fl}(x) = x(1+\epsilon)$.

Como não estamos trabalhando nos reais (às vezes escrevemos $\mathbb{F}$),
então as operações básicas não estão mais definidas como antes. Por exemplo,
$\text{fl}(1) = 1$ e $\text{fl}(10) = 10$, mas $1/10 \neq \text{fl}(1/10)$.

Sendo assim, redefinimos as operações de soma, subtração, divisão e
multiplicação. Seja $\ast$ uma das operações $+, -, \times, \div$, e seja
$\circledast$ a operação correspondente em ponto flutuante, dada por $ x
\circledast y = \text{fl}(x \ast y). $

Se pudermos definir um computador com as operações acima, teremos o chamado
Axioma Fundamental da Aritmética de Ponto Flutuante: Para todo $x, y \in
\mathbb{F}$, existe $\epsilon com |\epsilon| \leq \epsilon_{\text{machine}}$
tal que $ x \circledast y = (x \ast y)(1 + \epsilon). $

Note que a soma não é associativa.

```julia:ex59
(1.0 + 1e-16) + 1e-16 == 1.0 + (1e-16 + 1e-16)
```

```julia:ex60
((1.0 + 1e-16) + 1e-16)
```

```julia:ex61
(1.0 + (1e-16 + 1e-16))
```

```julia:ex62
((1.0 + 1e-16) + 1e-16) - (1.0 + (1e-16 + 1e-16))
```

Por isso é bastante importante ter noção dos erros que estão acontecendo,
para pensar na melhor maneira de se fazer certos cálculos.

$$\frac{d}{dx}\bigg(\sqrt{x}\bigg)\bigg|{x=a} = \lim{h\to 0} \frac{\sqrt{a +
h} - \sqrt{a}}{h} \approx \frac{\sqrt{a + h} - \sqrt{a}}{h},$$ para algum $h$
pequeno e positivo.

```julia:ex63
a = 1.0
for h = 10.0 .^ (-2:-1:-15)
  v = (sqrt(a + h) - sqrt(a)) / h
  println("h = $h, √$a ≈ $v, erro = $(v - 0.5)")
end
```

A aproximação ficou ruim quando $h$ aumenta muito. Mas veja que
$$\frac{\sqrt{a + h} - \sqrt{a}}{h} = \frac{a + h - a}{h(\sqrt{a + h} + \sqrt{a})} = \frac{1}{\sqrt{a + h} + \sqrt{a}}.$$

```julia:ex64
for h = 10.0 .^ (-2:-1:-15)
  v = 1 / (sqrt(a + h) + sqrt(a))
  println("h = $h, √$a ≈ $v, erro = $(v - 0.5)")
end
```

```julia:ex65
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
```

\cfig{fig-sqrt.png}

Perceba que alguns ponto do "Ruim" na verdade tem um erro nulo. Isso
acontece quando o ponto flutuante coincide com o valor real.

## Precisão Arbitrária

Da mesma maneira que às vezes queremos trabalhar com inteiros maiores que o
máximo da máquina, às vezes também estamos interessados em pontos flutuantes
com mais precisão que os da máquina. Em Julia, são chamados de `BigFloat`.

```julia:ex66
BigFloat(pi)
```

```julia:ex67
big"0.1"
```

```julia:ex68
sqrt(2.0)^2 - 2.0
```

```julia:ex69
sqrt(big"2.0")^2 - big"2.0"
```

```julia:ex70
nextfloat(big"0.0")  # Menor positivo
```

```julia:ex71
prevfloat(big"Inf")
```

Diferente dos BigInts, os BigFloats não crescem automaticamente. Devemos
usar a função abaixo para escolher a precisão do mesmo.

```julia:ex72
setprecision(2^15)
nextfloat(big"0.0") # Menor positivo
```

```julia:ex73
BigFloat(pi)
```

## Aproximações da derivada

Como aplicação de aritmética de ponto flutuante, vamos considerar o problema
de aproximar derivadas. A definição da derivada é $ \lim_{h \rightarrow 0}
\frac{f(x+h) - f(x)}{h}, $ então podemos aproveitar essa definição é
escolher um h pequeno e não nulo para aproximar essa derivada.

Vamos testar essa aproximação com f(x) = e^x, cuja derivada é f'(x).

```julia:ex74
DF(x, h) = (exp(x+h) - exp(x))/h
```

```julia:ex75
f(x) = exp(x)
```

```julia:ex76
using Plots
gr()
#Aproximação para $h = 1e-4$
h = 1e-4
plot(f, -1, 1, c=:blue)
plot!(x->DF(x, h), -1, 1, c=:red)
png(joinpath(@OUTPUT, "fig-der1")) # hide
```

\cfig{fig-der1.png}

```julia:ex77
plot(x->DF(x, h) - f(x), -1, 1, c=:blue)
png(joinpath(@OUTPUT, "fig-der2")) # hide
```

\cfig{fig-der2.png}

Essa aproximação parece bastante boa. Vamos ver num intervalo maior.

Aproximação para $h = 1e-4$

```julia:ex78
h = 1e-4
plot(f, -10, 10, c=:blue)
plot!(x->DF(x, h), -10, 10, c=:red)
png(joinpath(@OUTPUT, "fig-der3")) # hide
```

\cfig{fig-der3.png}

Vamos ver o erro dessa aproximação.
Aproximação para $h = 1e-4$

```julia:ex79
h = 1e-4
plot(x->f(x) - DF(x, h), -10, 10, c=:red)
png(joinpath(@OUTPUT, "fig-der4")) # hide
```

\cfig{fig-der4.png}

```julia:ex80
abs(f(1.0) - DF(1.0, 1e-4))/f(1.0)
```

Razoavelmente esperado, o erro está na casa dos $5\times 10^{-5}$. Vamos
diminuir o valor de h.

```julia:ex81
abs(f(1.0) - DF(1.0, 1e-5))/f(1.0)
```

Também esperado, o erro diminui. Vamos tentar um h bem menor.

```julia:ex82
abs(f(1.0) - DF(1.0, 1e-15))/f(1.0)
```

Ora, o erro aumentou bastante. Como você deve suspeitar, isso acontece por
causa dos erros de cancelamento. Vejamos um gráfico do erro em função de h.

```julia:ex83
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
```

\cfig{fig-der5.png}

Pelo gráfico podemos ver que o erro diminui até por volta de $10^{-8}$, e
depois aumenta, erraticamente. Vamos tentar descobrir teoricamente o motivo
disso.

Vamos usar o Teorema de Taylor com resto para encontrar um limitante para a
derivada aproximada. Veja que expandindo $f(x+h)$ em torno de $x$, temos $ f(x
+ h) = f(x) + f'(x)h + \frac{h^2}{2}f''(\xi), $ onde $\xi$ é um valor entre $x$
e $h$. Isso quer dizer que $ f'(x) = \frac{f(x+h) - f(x)}{h} -
\frac{h}{2}f''(\xi). $

Isso nos dá um embasamento teórico de porque o erro diminui inicialmente, e
porque é proporcional à $h/2$. No entanto, lembre-se que computacionalmente
não conseguimos calcular $f(x)$ exatamente. Na prática estamos calculando um
valor $\overline{f}(x)$ e $\overline{f}(x+h)$, e daí $ D_h(x) =
\dfrac{\overline{f}(x+h) - \overline{f}(x)}{h}. $

Lembre-se da limitação do erro é dada por um valor $\epsilon$ com $|\epsilon| <
\epsilon_M$ (da máquina), e portanto vamos usar diretamente $\epsilon_M$ como
limitante:
$$|\overline{f}(x) - f(x)| \leq \epsilon_M |f(x)|,$$
e
$$|\overline{f}(x+h) - f(x+h)| \leq \epsilon_M |f(x+h)|.$$
Considerando nosso
interesse num intervalo $(a,b)$ onde $x$ e $x+h$ residem, podemos limitar $|f(x)|$
por $L_1$ em todo esse intervalo, de modo que $ |\overline{f}(x) - f(x)| \leq
\epsilon_M L_1, $ e $ |\overline{f}(x+h) - f(x+h)| \leq \epsilon_M L_1. $

Logo, o erro de nossa aproximação é

\begin{align}
\text{Erro}(h) & = |f'(x) - Dh(x)| \\
& = \bigg| \frac{f(x+h)-f(x)}{h} - \frac{h}{2}f''(\xi) - \frac{\overline{f}(x+h)-\overline{f}(x)}{h} \bigg| \\
& = \bigg|\frac{\overline{f}(x+h)-f(x+h)-\overline{f}(x)+f(x)}{h} - \frac{h}{2}f''(\xi) \bigg| \\
& \leq \frac{|\overline{f}(x+h)-f(x+h)| + |\overline{f}(x) - f(x)|}{h} + \frac{h}{2}|f''(\xi)| \\
& \leq \frac{2\epsilon_M L_1}{h} + \frac{h}{2}L_2,
\end{align}

onde $L_2$ é um limitante
para $|f''(x)|$ no intervalo $(a,b)$.

```julia:ex84
hs = 10.0 .^ (-11:0.02:-2)
plot(hs, hs / 2, xaxis=:log, yaxis=:log, lab="h / 2")
plot!(hs, 2e-16 ./ hs, c=:red, lab="2e-16 / h")
png(joinpath(@OUTPUT, "fig-der6")) # hide
```

\cfig{fig-der6.png}

Note que o limitante para o erro depende de $1/h$ além de depender de h. Isso
quer dizer que a diminuição de h faz o erro crescer bastante, apesar do
termo linear dizer que o erro diminui. Felizmente, temos $1/h$ multiplicado
por $\epsilon_M$, de modo que esse erro começa relativamente pequeno.

Os problemas comeração quando o erro da esquerda for maior que o da direita,
começando de um valor grande de h e tendendo à 0. Nessa direção, o valor da
esquerda é crescente, e o da direta é decrescente. Então, podemos buscar
onde eles ficam iguais, e a partir daquele instante saberemos quando o da
esquerda fica maior que o da direita.

 $ \frac{2\epsilon_M L_1}{h} = \frac{h}{2}L_2 \qquad \Rightarrow \qquad h =
2\sqrt{\frac{L_1}{L_2}}\sqrt{\epsilon_M}. $

Os valores de $L_1$ e $L_2$ só podem ser obtidos em casos específicos, pois
dependem da função f, de sua segunda derivada, do intervalo em questão, e de
quão apertado é o limitante obtido. No entanto, é possível ver que existe
uma dependência linear com o valor $\sqrt{\epsilon_M}$, que no caso de
precisão dupla é $10^{-8}$. Não por acaso, o valor que vimos no gráfico.

Além disso, veja o valor que o limitante obtém quando substituímos esse
valor de h: $ 2\sqrt{\epsilon_M}\sqrt{L_1L_2}. $ Esse valor também condiz
com o valor encontrado no gráfico.

Agora, vamos fazer a mesma análise com a seguinte aproximação para a
derivada, chamada de diferença centrada,
$$ f'(x) = \frac{f(x+h) - f(x-h)}{2h} - \frac{h^2}{6}f''(\xi). $$

Exercício: Faça a mesma análise que fizemos anteriormente para encontrar um
valor ótimo para h que minimize o limitante do erro, e também o valor desse
limitante no h ótimo. Compare seus resultados com o do gráfico abaixo.

```julia:ex85
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
```

\cfig{fig-der7.png}
A mesma análise pode ser feita para a segunda derivada, assim como outras.
Além disso, existem várias maneiras de se aproximar as derivadas, utilizando
mais avaliações da função f.

### Exercícios

Faça os exercícios do capítulo 1 do livro Cálculo Numérico de Ruggiero e
Lopes.

  1. Para cada sequência abaixo, calcule o maior termo que pode ser
     representado por um inteiro de $64$ bits sem sinal.
     - $a_n = 2^n$;
     - $a_n = 3n + 5$;
     - $a_n = q a_{n-1}$ onde $q > 1$ e $a_0 = 1$;
     - $a_n = n!$ (use o computador):
     - $a_n = a_{n-1} + a_{n-2}$, com $a_0 = a_1 = 1$.

  2. Sabendo que a primeira e segunda derivadas de $f$ em $x$ existem, calcule os seguintes limites.

(Nota: Para real emoção, não use L'Hôpital).

- $\displaystyle \lim _ {h \to 0} \dfrac{f(x-h) - f(x)}{h}$;

- $\displaystyle \lim _ {h \to 0} \dfrac{f(x+h) - f(x-h)}{h}$;

- $\displaystyle \lim _ {h \to 0} \dfrac{f(x+2h) - 2f(x+h) + f(x)}{h}$;

- $\displaystyle \lim _ {h \to 0} \dfrac{f(x+h) - 2f(x) + f(x-h)}{h^2}$;

- $\displaystyle \lim _ {h \to 0} \dfrac{f(x + \alpha h) - f(x - \alpha
     h)}{h} ,\quad \alpha \neq 0$.

