# This file was generated, do not modify it. # hide
function equacao_price(i, p, V, n)
    #Implemente
    if i == 0
        return p - V / n
    else
        return p - V * i * (1 + i)^n / ((1 + i)^n - 1)
    end
end

function calc_juros(p, V, n :: Int)
    #Implemente
    if p < 0 || V < 0 || n < 1 || p ≥ V
        error("Não é possível")
    end
    f(i) = equacao_price(i, p, V, n)
    a = -1.0
    b = 1.0
    i, fi, k = bisseccao(f, a, b)
    return i
end