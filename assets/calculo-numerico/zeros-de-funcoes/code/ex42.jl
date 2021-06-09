# This file was generated, do not modify it. # hide
x, fx, iter = newton(x->x * exp(x) - 1, x->exp(x) * (1 + x), -1.0)