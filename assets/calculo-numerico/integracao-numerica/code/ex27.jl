# This file was generated, do not modify it. # hide
function simpson_composto(f, a, b; n = 100) # n eh o numero de pontos
    #Implemente
    if n % 2 == 0
        n = n + 1
    end
    h = (b - a) / (n - 1)
    I2 = I4 = 0.0
    x = a + 2h
    for i = 3:2:n-2
        I2 += f(x)
        x += h
        I4 += f(x)
        x += h
    end
    return (f(a) + 4 * f(a + h) + 4I4 + 2I2 + f(b)) * h / 3
end

simpson_composto(exp, 0, 1, n = 100) - (exp(1) - 1)