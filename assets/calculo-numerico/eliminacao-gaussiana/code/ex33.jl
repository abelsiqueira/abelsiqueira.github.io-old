# This file was generated, do not modify it. # hide
function resolve(A, b)
    Ac = copy(A)
    bc = copy(b)
    elim_gauss(Ac, bc)
    x = sist_tri_sup(Ac, bc)
    return x
end

A = rand(100, 100)
b = A * ones(100);