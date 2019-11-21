using FactCheck

# Se não tiver esse nome vai dar errado
include("tri_sup.jl")

# Se elim_gauss não estiver junto vai dar errado
# Se o nome da função não for tri_sup vai dar errado

facts("Exemplo da sala") do
  A = [3.0 1.0 2.0; -1.0 2.0 1.0; 1.0 1.0 4.0]
  b = [6.0; 2.0; 6.0]
  # Testando pra ver que não escrevi errado
  @fact A\b --> roughly(ones(3))
  # Testando elim_gauss
  U, c = elim_gauss(A, b)
  @fact A\b --> roughly(U\c)
  # Testando tri_sup
  x = tri_sup(U, c)
  @fact x --> roughly(ones(3))
end

facts("Vários exemplos aleatórios") do
  for n = 5:5:100
    A = rand(n,n) + n*eye(n)
    b = A*ones(n)
    U, c = elim_gauss(A, b)
    @fact U\c --> roughly(ones(n))
    x = tri_sup(U, c)
    @fact x --> roughly(ones(n))
  end
end
