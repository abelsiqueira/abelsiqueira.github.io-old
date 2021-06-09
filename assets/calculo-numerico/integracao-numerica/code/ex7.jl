# This file was generated, do not modify it. # hide
f(x) = exp(x) + cos(3π*x) * 0.5 + 3
F(x) = exp(x) + sin(3π*x)/6π + 3x
a, b = -2, 2
plot(f, a, b, c=:red, fill=(0,:red,0.5), leg=false)
plot!(x->f((a+b)/2), a, b, c=:blue, fill=(0,:blue,0.5))

function ponto_medio(f, a, b)
    return (b - a) * f((a + b) / 2)
end

ponto_medio(f, a, b) - (F(b) - F(a))