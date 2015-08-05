# Teste para o exercício da exponencial

# Você precisa criar um arquivo chamado `exponencial.jl`
include("exponencial.jl")

# Esse arquivo precisa definir uma função chamada exponencial que recebe x e
# retorna a aproximação para eˣ

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
