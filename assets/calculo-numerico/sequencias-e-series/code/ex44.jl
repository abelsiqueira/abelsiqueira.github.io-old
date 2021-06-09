# This file was generated, do not modify it. # hide
function exponencial3(x)
    #Implemente
    E = 1.0
    t = x
    k = 1
    while E + t != E
        E += t
        k += 1
        t *= x / k
    end
    return E
end

plot(x->exp(x) - exponencial3(x), 0, 10.0)
png(joinpath(@OUTPUT, "plt-exp6")) # hide