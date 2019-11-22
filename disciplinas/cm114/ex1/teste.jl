# Exercício - Exponencial

#=
O objetivo deste exercício é calcular o valor de exp(x) utilizando
a fórmula de Taylor

    exp(x) = 1 + x + x^2/2 + x^3/3! + x^4/4! + ...

O objetivo é conseguir o máximo de precisão possível, então essa expansão deve
ser utilizada até que o próximo termo não faça diferença na aproximação.

Você deve escrever um arquivo chamado `exponencial.jl` e implementar
a função exponencial que recebe um valor `x` e retorna a aproximação para `e^x`.

Para verificar que seu código funciona você deve usar o arquivo `teste.jl`.
Esse arquivo contém alguns valores básicos e comparações do erro obtido.
O seu programa só será considerado 100% correto se passar em todos os testes.

A entrega deste programa deve ser feita até às 18h da segunda feira
subsequente.
=#

## Começo do teste
include("exponencial.jl")

using Base.Test

function teste(ϵ = 1e-12)
  println("\033[0;33mTestando exponencial com |erro| < $ϵ\033[m")
  println("Alguns valores tradicionais:")
  for x in [0.0 1.0 -1.0 pi]
    println("e^$x = $(exponencial(x))")
  end
  E(x) = (exponencial(x) - exp(x))/exp(x)
  Eln(x) = log(exponencial(x)) - x
  println("Usando E(x) = (exponencial(x) - exp(x))/exp(x)")
  println("Usando Eln(x) = ln(exponencial(x)) - x")
  for x in [1.0 5.0 30.0 -1.0 -5.0]
    println("Erros para x = $(x): E(x) = $(E(x)), Eln(x) = $(Eln(x))")
    @test abs(E(x)) < ϵ
    @test abs(Eln(x)) < ϵ
  end
  println("Testando erro para 100 valores entre -30 e 30")
  range = linspace(-30, 30, 100)
  for x in range
    @test abs(E(x)) < ϵ
    @test abs(Eln(x)) < ϵ
  end
  println("\033[0;32mSucesso\033[0m")
end

teste()
