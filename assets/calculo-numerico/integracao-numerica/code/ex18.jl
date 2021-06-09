# This file was generated, do not modify it. # hide
f(x) = x^3 + x^2 + x + 1
F(x) = x^4/4 + x^3/3 + x^2/2 + x
a, b = 0, 1
simpson(f, a, b) - (F(b) - F(a))