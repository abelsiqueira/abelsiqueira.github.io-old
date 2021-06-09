# # Aproximações de Números e Funções por Sequências e Séries

# Os objetivos desta lição são
#
# - Identificar como lidar com sequências e séries em programação;
# - Entender que elementos anteriores da sequência são substituídos;
# - Tentar gastar o mínimo de elementos e variáveis (mantendo a clareza);
# - Tomar cuidado com overflow e underflow;
# - Relembrar/treinar a programação.

# ## Sequências
#
# Uma sequência em matemática é um conjunto de valores ordenados:
# $$ (a_1, a_2, a_3, \dots, a_n, \dots) $$

# O índice $1$ usado no primeiro elemento é arbitrário, e serve para normalizar essa ordem.
# Em alguns casos é mais interessante começar com o índice $0$.

# Matematicamente, costumamos estar interessados na convergência dessa sequência. No entanto, podemos utilizar uma sequência por outros motivos. Computacionalmente, estamos interessados em **como obter os elementos de uma sequência, quando necessário.**

# É importante ressaltar aqui a importância da frase **quando necessário**, pois como veremos a seguir, não é do nosso interesse calcular todos esses valores ao mesmo tempo, e quase sempre também não seria possível.

# ### Exemplo 1
#
# Dado um objeto com aceleração constante de $10 m/s^2$ saindo do repouso, queremos calcular sua posição nos instantes
# $t = 0, 0.1, 0.2, 0.3, \dots$.
# Note que temos uma sequência $t_n = (n-1)/10$, e queremos uma sequência $x_n$ das posições.
#
# Neste caso, porém, as leis de movimento nos dizem que
# $$ x(t) = x_0 + v_0 t + \frac{1}{2}at^2, $$
# que em nosso caso se reduz a
# $$ x(t) = 5t^2. $$
#
# Em outras palavras, a sequência $x_n$ pode ser calculada diretamente dado $t_n$, e $t_n$ também tem uma fórmula geral dado $n$,
# $$ x_n = 5\bigg(\frac{n-1}{10}\bigg)^2 = \frac{(n-1)^2}{20}. $$
# Desse modo, não é necessário guardar nada em especial, pois $x_n$ pode ser calculado diretamente a partir de $n$.

# ### Exemplo 2
#
# Dado um número $x \in \mathbb{N}, x > 1$, queremos calcular a sequência de Collatz desse número.
# Em particular, queremos calcular qual o primeiro elemento que é $1$ (se houver).
#
# Aqui é importante ressaltar a conjectura de Collatz: Dado um número $a_1 \in \mathbb{N}$, e a fórmula recursiva
# $$ a_{n+1} = \left\{\begin{array}{ll}
#     a_n/2, & \text{se } a_n \text{ é par}; \\
#     3a_n + 1, & \text{se } a_n \text{ é impar},
# \end{array}\right. $$
# sempre existe um elemento desta sequência tal que $a_n = 1$. A partir desse ponto a sequência perde a importância. Por exemplo, a sequência de Collatz de 3 é
#
# $$ 3 \rightarrow 10 \rightarrow 5 \rightarrow 16 \rightarrow 8 \rightarrow 4 \rightarrow 2 \rightarrow 1 \rightarrow 4 \rightarrow 2 \rightarrow 1 \cdots $$

# Nessa sequência, é necessário saber quem é o ponto atual, e é impossível saber um elemento arbitrário da sequência em casos gerais. Dessa maneira é preciso calcular elemento a elemento.

# Lembre-se que para verificar a paridade de um número, utilizamos `%`.

15 % 2
#
14 % 2
#
15 % 2 == 0 # É par ?
#
14 % 2 == 0 # É par ?

# Lembre-se também que para dividir um número e mantê-lo inteiro, usamos `div`.

div(15, 2)
#
div(14, 2)
#
14/2 # 7.0 e 7 são o mesmo valor, mas são diferentes em computação

# Um **erro** comum de alunos inexperientes nesse caso é **tentar numerar todos os elementos**.

a1 = 3
if a1 % 2 == 0
    a2 = div(a1, 2)
else
    a2 = 3 * a1 + 1
end
#

if a2 % 2 == 0
    a3 = div(a2, 2)
else
    a3 = 3 * a2 + 1
end

# Essa estratégia logo fica inviável. No entanto, note que precisamos apenas do valor atual da sequência, de maneira que podemos usar apenas uma mesma variável `a` que irá guardar sempre o valor mais atual.

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

# Rodando mais de uma vez esse bloco, fazemos uma nova iteração da sequência.
# Para deixar mais claro, vamos guardar também uma variável `n` que diz qual o índice da sequência.

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

# Note que `n` também pode ser usado para responder a pergunta original: quando `a` for 1, teremos o `n` marcando o índice correspondente.

# Isso nos leva a um conceito importante. Note que sequências contém infinitos elementos. No entanto, computacionalmente, não podemos fazer contas infinitas. Isso constitui um **loop infinito**. Códigos com loops infinitos são considerados **"errados"** (no sentido de não fazerem o que se espera), então devemos evitá-los.
# Portanto, o fato de percebermos que para resolver o problema, devemos fazer a conta do Bloco 2 até que `n` seja 1 é de extrema importância, pois isso evitará um loop infinito (dado que a conjectura de Collatz esteja correta).

# Com isso, podemos definir um termo formal para este conjunto de código com um objetivo específico:
#
# **Def. (Algoritmo):** Um algoritmo é uma coleção de instruções para realizar alguma tarefa específica. Segundo Knuth (The Art of Computer Programming, v.1), ele deve satisfazer as seguintes condições, parafraseadas aqui:
# - **Finitude:** O algoritmo deve acabar em tempo finito;
# - **Bem definido:** As intruções devem ser claras e sem ambiguidade;
# - **Entrada:** O algoritmo tem zero ou mais entradas, que são valores determinados antes do algoritmo começar. Essas entradas são especificados a partir de conjuntos de objetos;
# - **Saída:** O algoritmo tem uma ou mais saídas, que são quantidades relacionadas com as entradas;
# - **Eficácia/Computabilidade:** As operações feitas no algoritmo devem ser suficientemente básicas para que a princípio possam ser executadas por uma pessoa num espaço finito e tempo finito com papel e caneta.

# Podemos fazer uma prévia do nosso algoritmo:

#=
1. Entrada: $x$
2. Inicialização: $a \leftarrow x, n \leftarrow 1$.
3. Enquanto $a > 1$
    1. Se $a$ é par,
        faça $a \leftarrow a/2$
    2. Caso contrário,
        faça $a \leftarrow 3a + 1$.
    3. Incremente $n$.
4. Saída: $n$.
=#

# Nosso algoritmo para encontrar o primeiro elemento está quase feito. A entrada, saída, e todos os passos estão claros. Todos os passos são triviamente feitos com papel e caneta.
# No entanto, temos alguns pequenos problemas:
#
# - **E se a conjectura for falsa?**
# Se a conjectura é verdadeira, o algoritmo para quando encontra `1`, que pela conjectura, existe. Mas se não existe, pode ser que tenhamos um loop infinito. Dessa maneira, iremos colocar uma **condição de parada** para a falha do algoritmo. Não existe uma regra para a condição de parada. Deve-se tomar cuidado, no entanto, para não excluir a possibilidade do algoritmo funcionar em muitos casos. Uma condição de parada possível neste caso é que `n` seja muito grande. Se, por exemplo, fizermos 1 milhão de iterações e não encontrarmos `a_n = 1`, então talvez ele não exista. Note que essa condição exclui algumas soluções de aparecerem, por exemplo
# $$ a_1 = 2^{1.000.000}. $$
# É fácil ver que $a_n = 2^{1.000.001 - n}$, de modo que para `n = 1.000.001` teremos $a_n = 1$.
#
# Muitas vezes a condições de parada de falha é um limitante físico para deixar o algoritmo tratável. É muito fácil escolher um número `x` tal que nosso algoritmo leve horas para convergir. Não é do nosso interesse esperar tanto para um algoritmo recreativo. Poderíamos colocar uma condição de tempo então. Qual condição escolher é um assunto complicado, que depende de muitos outros fatores além da disciplina.
# Em especial, a teoria matemática arredor do problema deve ser considerada. Imagine que a conjectura de Collatz é falsa, e que `x` é um valor finito tal que a sequência gerada com `a_1 = x` nunca decresça à `1`. *Como é possível verificar que `x` é um contra-exemplo para a conjectura?*

# - **O maior inteiro.**
# O computador é uma máquina física, com limitações impostas para que seja possível fazer contas determinísticas.
# Dessa maneira, ele segue regras para definir números inteiros e "reais" (as aspas serão explicadas depois), e essas regras limitam o maior inteiro que pode ser representado por um tipo específico de dado.
# Mais importante, esse valor é independente da linguagem. A saber, o tipo de inteiro básico do Julia é o `Int64`, de 64 bits, e cujo maior valor é $2^{63}-1 \approx 10^{18}$. Coisas estranhas acontecem se fizermos qualquer conta com esse valor, de modo que é imperativo não ultrapassá-lo. Vamos colocar uma nova condição de parada no nosso código: se $a > 10^{17}$, também paramos.

#=
1. Entrada: $x \in \mathbb{N}$
2. Inicialização: $a \leftarrow x, n \leftarrow 1, a\_\text{bound} = 10^17, n\_\text{bound} = 10^6$
3. Se $a \leq 0$
    faça $n \leftarrow 0$
    termine o algoritmo
4. Enquanto $a > 1$
    1. Se $a$ é par,
        faça $a \leftarrow a/2$
    2. Caso contrário,
        faça $a \leftarrow 3a + 1$.
    3. Incremente $n$.
    4. Se $a > a\_\text{bound}$
        faça $n \leftarrow -1$ e termine o algoritmo
    5. Se $n > n\_\text{bound}$
        faça $n \leftarrow -2$ e termine o algoritmo
5. Saída: $n$
    Se $n > 0$, então $a_n = 1$: Saída bem sucedida,
    Se $n = 0$, então $x \leq 0$: Saída de erro na entrada,
    Se $n = -1$, então $a$ ficou muito grande: Saída de valor muito grande,
    Se $n = -2$, então $n$ ficou muito grande: Saída de muitas iterações.
=#

# Keyword argument
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
#
collatz(151)
#
collatz(2^30, n_bound=10)
#
collatz(1)
#
collatz(10^17+2)

# ## Fibonacci
#
# Vamos continuar nosso exemplo com mais uma sequência interessante, a de Fibonacci:
#
# $$ F_1 = F_2 = 1 \qquad F_{n+1} = F_n + F_{n-1}. $$

# A sequência de Fibonacci envolve dois termos, e cresce infinitamente. Existem vários motivos para se trabalhar com a série de Fibonacci, mas vamos utilizá-la recreativamente.
# Vamos criar um simples algoritmo para calcular o n-ésimo termo da série de Fibonacci. Assuma, por enquanto, que todos os termos serão bem representados por inteiros de 64 bits.

#=
   Entrada: $n$ inteiro
1. Se $n \leq 0$
    retorne $0$
2. Se $n = 1$ ou $n = 2$
    retorne $1$
3. Inicialização: $F_1 \leftarrow 1, F_2 \leftarrow 1, k \leftarrow 2$
4. Enquanto $k < n$
    1. $F_{\text{novo}} \leftarrow F_1 + F_2$ - Isso calcula o valor novo
    2. $F_1 \leftarrow F_2$ - O valor $F_2$ passa a ser o mais antigo dos dois
    3. $F_2 \leftarrow F_{\text{novo}}$ - O valor $F_{\text{novo}}$ passa a ser o anterior
    4. Incremente $k$
5. Retorne $F_2$.
    Saída: 0 se a entrada estava incorreta,
           $F_n$ caso contrário.
=#

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

# É bastante simple calcular um elemento da sequência de Fibonacci, e é interessante que podemos explorar outra maneira de fazer isso.

# ### Recursão

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
#
fat_por_recursao(21)

# operador ternário

# PROP ? Resultado se SIM : Resultado se NAO
5 > 0 ? "ok" : "oops"
#
fat_uma_linha(n::Int) = n == 0 ? 1 : n * fat_uma_linha(n - 1)
#
fat_uma_linha(5)

# Recursão é uma das partes mais importantes no desenvolvimento de códigos. Muitas estratégias computacionais e matemáticas envolvem o chamado "dividir e conquistar" ou "reduzir para um caso conhecido". Em particular, demonstrações por indução finita fazem uma coisa parecida, onde você supõe saber resolver para um caso e consegue resolver um caso de nível superior reduzindo-o ao caso conhecido.

# Computacionalmente, podemos pensar em recursão como a divisão de um problema em outros, cada um destes menor que o primeiro. Para cada problema menor, repetimos o processo. Como não podemos ter um loop infinito, é necessário terminar essa redução de alguma maneira. Essa maneira envolve, simplesmente, saber resolver alguns casos de problema menor (que garantam a convergência).

# No caso de Fibonacci, o cálculo do n-ésimo termo é feito calculando os termos n-1 e n-2.
# Os casos n-1 e n-2 são, de fato, menores. Além disso, repetindo este processo chegaremos a dois casos: n = 1 ou n = 2. Desse modo, temos
#
# - casos pequenos que conseguimos resolver trivialmente;
# - uma maneira de reduzir um problema em outros menores;
# - garantia matemática que essa redução leva aos problemas menores que sabemos resolver.
#
# Abaixo temos um pseudo-código.

#=
Rotina $\text{FIBO}(n)$

Entrada: $n$
1. Se $n = 1$ ou $n = 2$
    retorne $1$
2. Senão,
    retorna $\text{FIBO}(n-1) + \text{FIBO}(n-2)$
=#

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

# Muitas vezes, o código de recursão será mais curto.
# Em particular, em Julia (e C) temos o chamado **operador ternário**, que nos permite fazer a pergunta `if ... else ... end` em uma única linha.
# Desse modo, temos uma implementação curtíssima de Fibonacci:

F(n) = n <= 2 ? min(1, max(n, 0)) : F(n-1) + F(n-2)

for n = 1:20
    println("F_$n = $(F(n))")
end

# No entanto, é importante ter cuidado ao utilizar recursão. O custo computacional fica escondido nas chamadas de função, e às vezes podemos deixar um código muito mais complicado do que deveria.
# No caso de Fibonacci, por exemplo, ao calcular `F(n)`, pedimos o cálculo de `F(n-1)` e `F(n-2)`, mas o cálculo de `F(n-1)` irá pedir o cálculo de `F(n-2)` e `F(n-3)`, ou seja, `F(n-2)` será calculado duas vezes!

function FIBO_comprint(n)
    println("Chamada: F$n")
    if n <= 2
        return min(1, max(n, 0)) # Pequeno truque
    else
        return FIBO_comprint(n-1) + FIBO_comprint(n-2)
    end
end

FIBO_comprint(5)

# Em outras palavras, Fibonacci com recursão acaba sendo muito mais caro que Fibonacci usando `for` ou `while`. Tome cuidado com essas armadilhas.
#
# **Leitura adicional:** Existe um conceito chamada "Avaliação preguiçosa", que consiste na avaliação dos valores somente quando são necessários. Em Julia, o pacote `Lazy.jl` implementa esse conceito. Se a avaliação de `F(n)` for feita de maneira preguiçosa, não haverá o custo adicional do cálculo de $F_n$ repetidos.

# ## Mais Fibonacci

# Vamos voltar nossa atenção ao problema inicial de Fibonacci: calcular o n-ésimo termo. Nossas últimas discussões foram todas no sentido de como calcular os elementos de Fibonacci termo a termo ou recursivamente. Porém, matematicamente, o n-ésimo termo de Fibonacci é bem definido!

# $$ F_n = \frac{\phi^n - \psi^n}{\sqrt{5}}, $$
# onde $$\phi = \frac{1 + \sqrt{5}}{2}$$ e $$\psi = \frac{1 - \sqrt{5}}{2} = 1 - \phi. $$

# Isso quer dizer que podemos calcular Fibonacci com uma fórmula direta.

phi = (1 + sqrt(5))/2
psi = 1 - phi
for n = 1:20
    Fn = round(Int, (phi^n - psi^n)/sqrt(5))
    println("F_$n = $Fn")
end

# Perceba que o problema aqui agora é outro. Os valores não estão mais "corretos". Na verdade, quase todos contém um pequeno **erro**.

# Quão pequeno?

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

# Impressionantemente, esse erro não é tão pequeno assim. Ele cresce com o tamanho de `n`, de modo que essa aproximação é inviável para valores grandes de `n`.

# A fórmula para o n-ésimo número de Fibonacci é
# $$ F_n = \frac{\phi^n - \psi^n}{\sqrt{5}}. $$

# Acontece que $\phi > 1$ e $0 < \psi < 1$, então a distância entre $\phi^n$ e $\psi^n$ cresce bastante com $n$.
# Além disso, ambos são irracionais, então seus valores já são aproximados. Neste caso, é mais simples calcular os números de Fibonacci utilizando `for` ou `while` com inteiros.
# Claro que isso também vai depender do motivo para se calcular esses números.

# # Aproximações de Séries

# Vamos para um assunto levemente diferente. Uma série é uma soma de infinitos termos numa ordem dada.
# $$ S = \sum_{k = 1}^{\infty} a_k. $$
# A questão aqui é, em geral, se essa soma existe ou não. Para tanto, define-se uma sequência $(s_1,s_2,\dots,s_n,\dots)$ dada por
# $$ s_n = \sum_{k = 1}^n a_k. $$

# Se essa sequência convergence, então essa série converge.

# Computacionalmente, em geral, estamos mais preocupados em calcular essa soma. Um resultado básico de série diz que para que a série convirja, é necessário que $a_k \rightarrow 0$. Como já vimos, isso irá nos causar alguns problemas, dado que
# $$ s_{n+1} = s_n + a_{n+1}, $$
# e $a_{n+1}$ vai eventualmente ser muito pequeno.

# Matematicamente, muitas vezes temos um objetivo, como calcular $\pi$, que pode ser obtido pelo cálculo de uma série. Devemos nos preocupar em como fazer isso de uma maneira computacional eficiente que não perca muita precisão. Frequentemente, teremos limites computacionais para essa eficiência, e aí devemos voltar à matemática para conseguir alguma maneira melhor de resolver o problema inicial.

# ## Expansão de Taylor

# Como deve ter sido visto no curso de Cálculo, uma função continuamente diferenciável até ordem $n$ admite uma aproximação polinomial em torno de um ponto $a$ de seu domínio dada por
# $$ P_n(x) = f(a) + f'(a)(x-a) + \frac{1}{2}f''(a)(x-a)^2 + \frac{1}{3!}f'''(a)(x-a)^3 + \dots + \frac{1}{n!}f^{(n)}(a)(x-a)^n. $$

# Esse polinômio é chamado polinômio de Taylor de ordem $n$ em torno do ponto $a$, e existem alguns teoremas indicando o quão boa é essa aproximação.

# **Teorema:** Se $f$ é continuamente diferenciável até ordem $n$ no ponto $a$, então
# $$ f(x) = P_n(x) + r_n(x), $$
# onde
# $$ \lim_{x \rightarrow a} \frac{ r_n(x) }{ |x - a|^n } = 0. $$

# **Teorema:** Se $f$ é continuamente diferenciável até ordem $n+1$ no intervalo fechado de $a$ à $x$, então
# $$ f(x) = P_n(x) + \int_a^x \frac{f^{(n+1)}(t)}{n!}(x-t)^n \text{d} t. $$

# **Teorema:** Se $f$ é continuamente diferenciável até ordem $n+1$ num intervalo aberto contento $a$ e $f^{(n)}$ é contínua no intervalo fechado de $a$ à $x$, então
# $$ f(x) = P_n(x) + \frac{1}{(n+1)!} f^{(n+1)}(\xi)(x - a)^{n + 1}, $$
# onde $\xi$ é um número real entre $a$ e $x$.

# Podemos usar o conceito da expansão de Taylor para calcular numericamente alguns valores de funções não polinomiais. O caso mais comum é o da função $\exp(x) = e^x$, onde $e$ é o número de Euler.

MathConstants.e

# *Aviso: A função exponencial já costuma estar implementada em baixo nível, no entanto faremos este estudo por questões didáticas.*

# A função $e^x$ tem a seguinte expansão de Taylor em torno do ponto $0$.
# $$ e^x = 1 + x + \frac{x^2}{2} + \frac{x^3}{3!} + \frac{x^4}{4!} + \dots + \frac{x^n}{n!} + \dots. $$

# Então é bastante simples definir um algoritmo que calcule a aproximação da exponecial dado $x$ e $n$.

#=
    Entrada: x e n ≧ 0
1. Inicialização: $E \leftarrow 1.0$
2. Para k de 1 à n
    1. $E \leftarrow E + x^k/k!$
3. Retorne E
    Saída: E ≈ eˣ com n termos da expansão de Taylor
=#

E = 1.0
E += 1.0   # k = 1
E += 0.5   # k = 2
E += 1/6   # k = 3
E += 1/24  # k = 4
E += 1/120 # k = 5
#
MathConstants.e - E
#
function exponencial(x, n)
    #Exercício. Usa a função factorial(n) para calcular n!
    E = 1.0
    for k = 1:n
        E += x^k / factorial(k)
    end
    return E
end

exponencial(1.0, 20)
#
MathConstants.e - exponencial(1.0, 20)
#
abs( exp(2) - exponencial(2.0, 20) ) / exp(2)
#
abs( exp(3) - exponencial(3.0, 20) ) / exp(3)
#
abs( exp(10) - exponencial(10.0, 20) ) / exp(10)
#
abs( exp(3) - exponencial(3.0, 21) ) / exp(3)

# Vamos testar nossa função contra `exp`, calculando o erro dessa aproximação.
# No entanto, note que a função exponencial cresce rapidamente, e como vimos, a precisão de um valor é relativo ao valor. Sendo assim, vamos utilizar o **erro relativo** na nossa comparação.

# **Definição:** O erro cometido ao se aproximar $x$ por $x'$ é $x - x'$.
#
# **Definição:** O **erro absoluto** cometido ao se aproximar $x$ por $x'$ é $|x - x'|$.
#
# **Definição:** O **erro relativo** cometido ao se aproximar $x$ por $x'$ é $\dfrac{|x - x'|}{|x|}$.

using Plots
gr(size=(400,300))

N = collect(1:20)
Erro = [abs(exponencial(1.0, n) - exp(1.0))/exp(1.0) for n in N]
scatter(N, Erro, yaxis=:log)
png(joinpath(@OUTPUT, "plt-exp1")) # hide

# \cfig{plt-exp1.png}

# Note que após $n = 17$, o erro é sempre a precisão da máquina. Isso quer dizer que os termos $a_n$ com $n > 17$ não afetam a soma, computacionalmente.

N = collect(1:20)
Erro = [abs(exponencial(5.0, n) - exp(5.0))/exp(5.0) for n in N]
scatter(N, Erro, yaxis=:log)
png(joinpath(@OUTPUT, "plt-exp2"))

# \cfig{plt-exp2.png}

# Veja que é erro é muito maior para $x = 5$ do que para $x = 1$. Isso acontece porque os termos além de $n > 20$  ainda são importantes para a aproximação de $e^5$.
# A primeira vista, uma simples solução seria utilizar $n > 20$, mas veja o que acontece com nossa implementação.

# Se você se lembra bem, isso acontece porque para $21!$ é maior que o máximo dos inteiros de 64 bits. Isso quer dizer que para calcular $e^x$ corretamente, devemos dar mais atenção aos detalhes do algoritmo.
# Note também que $x^n$ pode acabar ficando muito grande para $x$ e $n$ grandes e causar overflow também.

# Revisitando nossa soma:
# $$ s_n = 1 + x + \frac{x^2}{2} + \dots + \frac{x^n}{n!}, $$
# de modo que
# $$ s_n = s_{n-1} + \frac{x^n}{n!}. $$
# O termo à direita da soma não pode ser calculado diretamente pois cada termo da fração pode "explodir" (termo que utilizarei para dizer causar overflow). No entanto, o resultado da fração é bem comportado, então podemos tentar chegar nesse valor de outra maneira.

# Veja que
# $$ \frac{x^n}{n!} = \frac{x\times x\times x\times\dots\times x}{1\times2\times3\times\dots\times n}
# = \frac{x}{1}\times\frac{x}{2}\times\frac{x}{3}\times\dots\times\frac{x}{n},
# $$
# então podemos fazer esse cálculo seguindo essa ordem, de maneira que o produto todo ficará equilibrado.

# No entanto, é possível deixar esse produto mais eficiente. Note que se chamarmos $t_n = \dfrac{x^n}{n!}$, então
#
# $$ s_n = s_{n-1} + t_n, $$
# e
# $$ t_n = t_{n-1}\times\frac{x}{n}. $$

# Em outras palavras, a sequência que é somada também pode ser calculada utilizando o termo anterior. Cada iteração fará então apenas um produto, uma divisão, e uma soma.

# Gráfico do termo
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

# \cfig{plt-exp3.png}

#=
    Entrada: $x$ e $n \geq 0$
1. Inicialização: $E \leftarrow 1.0, t \leftarrow 1.0$
2. Para $k$ de $1$ à $n$
    1. $t \leftarrow t * x / k$
    2. $E \leftarrow E + t$
3. Retorne $E$
    Saída: $E \approx e^x$ com n termos da expansão de Taylor
=#

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
#
(exponencial2(10.0, 60) - exp(10.0)) / exp(10)
#
using Plots
N = collect(1:50)
Erro = [abs(exponencial2(1.0, n) - exp(1.0))/exp(1.0) for n in N]
Erro[findall(Erro .== 0.0)] .= eps()
scatter(N, abs.(Erro), yaxis=:log)
png(joinpath(@OUTPUT, "plt-exp4")) # hide

# \cfig{plt-exp4.png}

N = collect(1:50)
Erro = [abs(exponencial2(10.0, n) - exp(10.0))/exp(10.0) for n in N]
Erro[findall(Erro .== 0.0)] .= eps()
scatter(N, Erro, yaxis=:log)
ylims!(eps()/2, 1.0)
png(joinpath(@OUTPUT, "plt-exp5")) # hide

# \cfig{plt-exp5.png}

# Perceba agora que a função `exp` não recebe um $n$ específico. A quantidade de termos calculados é específico para o valor $x$. Para $x = 0$, $n = 0$ basta, para $x = 1$, $n = 17$ basta, para $x = 10$, $n = 45$ foi necessário.

# Em particular, como estamos fazendo uma atualização do tipo $s_n = s_{n-1} + t_n$ e $t_n$ tende a 0, podemos verificar se obtivemos um erro de arredondamento na soma, de modo que os termos seguintes também não acrescentarão nada.

#=
    Entrada: $x$
1. Inicialização: $E \leftarrow 1.0, t \leftarrow x, k \leftarrow 1$
2. Enquanto $E + t \neq E$
    1. $E \leftarrow E + t$
    2. Incremente $k$
    3. $t \leftarrow t * x / k$
3. Retorne $E$
    Saída: $E \approx e^x$
=#

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

# \cfig{plt-exp6.png}

plot(x->abs(exp(x) - exponencial3(x))/exp(x), 0, 10.0)
png(joinpath(@OUTPUT, "plt-exp7")) # hide

# \cfig{plt-exp7.png}

# Por fim, vejamos o que acontece com $x < 0$.

plot(x->abs(exp(x) - exponencial3(x))/exp(x), -10.0, 10.0)
png(joinpath(@OUTPUT, "plt-exp7")) # hide

# \cfig{plt-exp7.png}

# O erro cresce novamente. Isso acontece porque o termo $t_n$ fica alternando de sinal, e fica pequeno antes de contribuir o suficiente para fazer a diferença necessária.
# Uma maneira de remediar esse problema é usar a relação $e^x = \dfrac{1}{e^{-x}}$.

function exponencial4(x)
    if x < 0
        return 1.0/exponencial4(-x)
    end
    #Implemente
    return exponencial3(x)
end

plot(x->abs(exp(x) - exponencial4(x))/exp(x), -10.0, 10.0)
png(joinpath(@OUTPUT, "plt-exp8")) # hide

# \cfig{plt-exp8.png}

# ## Cálculo de $\pi$

# Um tópico bastante interessante de computação matemática é o cálculo do valor de $\pi$. O interesse no cálculo de $\pi$ é antigo, e existem várias maneiras de fazê-lo. Além disso, a busca pelo valor de $\pi$ com a maior quantidade de dígitos corretos é uma disputa matemática bastante acirrada.

# Das maneiras de calcular $\pi$, uma das mais interessantes, em minha opinião, é através da identidade
# $$ \arctan 1 = \frac{\pi}{4} \qquad \Rightarrow \qquad \pi = 4 \arctan 1. $$

# Agora, utilizamos a derivada de $\arctan$:
# $$ \frac{\text{d}}{\text{d}x}\arctan x = \frac{1}{1+x^2}, $$
# e a expansão da fração para $|x| < 1$:
# $$ \frac{1}{1+x^2} = 1 - x^2 + x^4 - x^6 + \dots + (-1)^n x^{2n} + \dots. $$

# Integrando, temos
# $$ \arctan x = x - \frac{x^3}{3} + \frac{x^5}{5} - \frac{x^7}{7} + \dots + (-1)^n\frac{x^{2n+1}}{2n+1} +
# \dots$$

# É possível mostrar que essa série converge para $x = 1$ também, de modo que
# $$ \frac{\pi}{4} = \arctan 1 = 1 - \frac{1}{3} + \frac{1}{5} - \frac{1}{7} + \dots \frac{(-1)^n}{2n+1} + \dots. $$

# Utilizando conceitos parecidos com o da expansão da exponencial, podemos calcular $\pi$ sem precisar passar um valor de $n$, **porém**, essa convergência é muito lenta. No exemplo abaixo, colocaremos uma condição de parada para $n > 1.000.000.000$.

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
#
@time pi_atan() - pi

# O valor é, de fato, calculado até uma aproximação razoável, mas demora muito e leva muitas iterações.
# Por sorte, existem dezenas de outras maneiras de se calcular $\pi$.

# Uma dessas maneiras é a série
# $$ \pi = \sqrt{12}\bigg(1 - \frac{1}{3\times 3} + \frac{1}{5\times 3^2} - \frac{1}{7\times 3^3} + \frac{1}{9\times 3^4} - \dots\bigg) = \sqrt{12}\sum_{k=0}^{\infty}\frac{(-1)^k}{(2k+1)3^k}. $$

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

# Note que com 31 iterações já chegamos num valor de $\pi$ decente.

# ### $\pi$ com BigFloat

# Como dito anteriormente, existe uma busca por $\pi$ com diversas casas decimais corretas. Você já deve ter percebido que o Julia traz uma implementação própria de $\pi$, chamada através de `pi`. Essa aproximação pode ser vista com `BigFloat` também.

BigFloat(pi)

# Podemos modificar nossa implementação para buscar $\pi$ com `BigFloat` também.

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
#
setprecision(2^11)
round(Int, -log10(eps(BigFloat)))
#
for n = 10:14
    global E # hide
    setprecision(2^n)

    E = max(abs(pi_madhava_BF() - BigFloat(pi)), eps(BigFloat))
    casas = round(Int, -log10(E))
    println("Com $(2^n) bits obtive $casas casas")
end
#
setprecision(2^15)
@time pi_madhava_BF();
#
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

# # Exercícios
#
# Faça os exercícios do capítulo 1 do livro Cálculo Numérico de Ruggiero e Lopes.

# 1. Calcule a expansão de Taylor das seguintes funções, em torno do ponto a dado:
#
#   - $f(x) = x^2 - 5x + 6$, $a = 2$;
#   - $g(x) = x^3 - 3x^2 + 3x - 1$, $a = 1$;
#   - $h(x) = e^x$, $a = 0$;
#   - $z(x) = \ln (x)$, $a = 1$;
#
# 5. Considere as seguintes séries e sequências convergentes:
#
#   - $2 = 1 + \frac{1}{2} + \frac{1}{4} + \frac{1}{8} + \dots + \frac{1}{2^n} + \dots$.
#   - $a_{n+1} = \frac{a_n}{2} + \frac{1}{a_n}$, com $a_1 = 1$.
#   - $b_{n+1} = \sqrt{b_n + 1}$, com $b_1 = 1$.
#   - $\phi_n = \dfrac{F_n}{F_{n-1}}$, onde $F_n$ é o n-ésimo termo de Fibonacci.
#   - Alguma série para $\pi$ da internet.
#
#   Para cada uma delas, faça os seguintes itens
#
#   - Implemente uma função que recebe um número $n$ e calcula a soma parcial $s_n$
#     se o item for uma série, ou n-ésimo elemento se o item for uma sequência.
#     Faça sua função ser o mais econômica possível e evite overflows.
#   - Faça um gráfico do erro pelo número de termos $n$.
#   - Dado $\varepsilon > 0$, é possível determinar n de modo que o erro seja menor que $\varepsilon$?
#     Veja quantos casos você consegue fazer isso, ou encontrar algum limitante
#     desse tipo.
