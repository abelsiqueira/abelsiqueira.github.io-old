# This file was generated, do not modify it. # hide
using Printf

f(x) = x^2 - 1.0
fder(x) = 2x
x = 10.0
k = 0
@printf("%2s  %11s  %11s\n", "k", "f(x)", "x_k - 1.0")
@printf("%-2d  %+10.4e  %+10.4e\n", k, f(x), x - 1.0)
while abs(f(x)) > 1e-12
    global x # hide
    x = x - f(x)/fder(x)
    k += 1
    @printf("%-2d  %+10.4e  %+10.4e\n", k, f(x), x - 1.0)
end