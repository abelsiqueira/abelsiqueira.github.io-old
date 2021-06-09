# This file was generated, do not modify it. # hide
a = 1/sqrt(5)
println("1/√5 = $a")
x, fx, iter = newton(x->x^3 - x, x->3x^2 - 1, 1/sqrt(5))
println("x = $x, iter = $iter")