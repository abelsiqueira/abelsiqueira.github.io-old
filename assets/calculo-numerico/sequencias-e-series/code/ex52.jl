# This file was generated, do not modify it. # hide
function pi_madhava_BF()
    S = BigFloat(1.0)
    third = BigFloat(1.0)/BigFloat(3.0)
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
        if n > 1_000_000
            break
        end
    end
    println("n = $n") # Usar para mostrar quantas iterações
    return sqrt(BigFloat(12.0)) * S
end

setprecision(2^10)
pi_madhava_BF() - pi