# This file was generated, do not modify it. # hide
function mmc(a::Int, b::Int)
    if a < 1 || b < 1
        error("Entrada deve ser de dois inteiros positivos")
    end
    xa, xb = a, b # Múltiplos de a e b
    while (xa != xb) # Não preciso dos parenteses
        if xa < xb
            xa = xa + a
        else
            xb = xb + b
        end
    end
    return xa
end