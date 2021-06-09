# This file was generated, do not modify it. # hide
using ForwardDiff

f(x) = exp(x) * x - 1
g(x) = ForwardDiff.derivative(f, x)