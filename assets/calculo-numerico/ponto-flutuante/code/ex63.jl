# This file was generated, do not modify it. # hide
a = 1.0
for h = 10.0 .^ (-2:-1:-15)
  v = (sqrt(a + h) - sqrt(a)) / h
  println("h = $h, √$a ≈ $v, erro = $(v - 0.5)")
end