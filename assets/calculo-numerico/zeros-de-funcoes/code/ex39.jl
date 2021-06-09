# This file was generated, do not modify it. # hide
f(x) = x^2 - 2
fder(x) = 2x
x0 = 1
x, fx, iter = newton(f, fder, x0, atol=1e-12, rtol=1e-12)