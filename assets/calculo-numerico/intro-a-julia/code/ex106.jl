# This file was generated, do not modify it. # hide
function aproxima_derivada(f, a, h)
    Δf = f(a + h) - f(a)
    return Δf / h
end