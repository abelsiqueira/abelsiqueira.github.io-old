# This file was generated, do not modify it. # hide
function sist_tri_sup(A, b)
    n = length(b)
    x = zeros(n)
    for j = n:-1:1
        if abs(A[j,j]) < 1e-14
            error("Não deu")
        end
        s = b[j]
        for k = j+1:n
            s -= A[j,k] * x[k]
        end
        x[j] = s / A[j,j]
    end
    return x
end

A = [3.0 1 2; -1 2 1; 1 1 4]
b = [6.0;2;6]
elim_gauss(A, b)
sist_tri_sup(A, b)