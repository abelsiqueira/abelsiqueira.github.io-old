# This file was generated, do not modify it. # hide
for h = 10.0 .^ (-2:-1:-15)
  v = 1 / (sqrt(a + h) + sqrt(a))
  println("h = $h, √$a ≈ $v, erro = $(v - 0.5)")
end