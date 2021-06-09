# This file was generated, do not modify it. # hide
function FIBO_comprint(n)
    println("Chamada: F$n")
    if n <= 2
        return min(1, max(n, 0)) # Pequeno truque
    else
        return FIBO_comprint(n-1) + FIBO_comprint(n-2)
    end
end

FIBO_comprint(5)