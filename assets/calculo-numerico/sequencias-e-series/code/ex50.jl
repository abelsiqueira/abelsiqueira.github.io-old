# This file was generated, do not modify it. # hide
function pi_madhava()
    S = 1.0
    third = 1.0/3.0
    σ = -1
    pow_third = third
    t = σ * third * third
    n = 1
    while S + t != S
        S += t
        n += 1
        pow_third *= third
        σ = -σ
        t = σ * pow_third / (2n + 1)
    end
    println("n = $n") # Usar para mostrar quantas iterações
    return sqrt(12) * S
end

pi_madhava() - pi