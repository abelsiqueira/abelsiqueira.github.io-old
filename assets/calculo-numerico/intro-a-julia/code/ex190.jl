# This file was generated, do not modify it. # hide
function fatorial3(n :: Int)
    if n ≤ -1
        error("ERRO: Fatorial só está definido para números ≥ 0")
    end
    if n ≥ 20
        error("ERRO: Fatorial de $n explode")
    end
    resultado = 1
    for i = 1:n
        resultado = resultado * i
    end
    return resultado
end