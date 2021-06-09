# This file was generated, do not modify it. # hide
function FIBO(n)
    if n <= 2
        return min(1, max(n, 0)) # Pequeno truque
    else
        return FIBO(n-1) + FIBO(n-2)
    end
end

FIBO(10)

for n = 1:20
    println("F_$n = $(FIBO(n))")
end