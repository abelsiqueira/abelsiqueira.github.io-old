# This file was generated, do not modify it. # hide
function exponencial4(x)
    if x < 0
        return 1.0/exponencial4(-x)
    end
    #Implemente
    return exponencial3(x)
end

plot(x->abs(exp(x) - exponencial4(x))/exp(x), -10.0, 10.0)
png(joinpath(@OUTPUT, "plt-exp8")) # hide