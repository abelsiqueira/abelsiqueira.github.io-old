# This file was generated, do not modify it. # hide
function bhaskara(a, b, c)
    Δ = b^2 - 4 * a * c
    if Δ < 0
        error("Nos reais não tem solução")
    end
    return (-b + sqrt(Δ)) / 2a, (-b - sqrt(Δ)) / 2a
end