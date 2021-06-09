# This file was generated, do not modify it. # hide
function exponencial2(x, n)
    #Implemente
    E = 1.0
    t = 1.0
    for k = 1:n
        t *= x / k
        E += t
    end
    return E
end

exponencial2(1.0, 20)