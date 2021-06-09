# This file was generated, do not modify it. # hide
function exponencial(x, n)
    #Exercício. Usa a função factorial(n) para calcular n!
    E = 1.0
    for k = 1:n
        E += x^k / factorial(k)
    end
    return E
end

exponencial(1.0, 20)