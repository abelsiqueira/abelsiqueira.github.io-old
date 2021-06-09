# This file was generated, do not modify it. # hide
a, b = 0, 1
M2 = exp(b) # Pois exp(x) é crescente
ε = 1e-7
hmax = sqrt(6ε / M2 * (b - a))

mmin = (b-a)/hmax - 1