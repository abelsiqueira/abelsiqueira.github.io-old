# eˣ = 1 + x + \dots + xⁿ/n! + e^yx^{n+1}/(n+1)
function exponencial(x)
  if x < 0
    return 1/exponencial(-x)
  end
  e = 1.0
  t = 1.0
  k = 1
  while abs(t) > 1e-12
    t *= x/k
    e += t
    k += 1
  end
  println("k = $k")
  return e
end
