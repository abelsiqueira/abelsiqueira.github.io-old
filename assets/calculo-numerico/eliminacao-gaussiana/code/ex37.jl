# This file was generated, do not modify it. # hide
function elim_gauss(A, b; diagtol = 1e-12)
    n = length(b)
    for j = 1:n-1
        ajj, bj = A[j,j], b[j]
        if abs(ajj) <= diagtol
            error("Diagonal muito próxima de 0")
        end
        for i = j+1:n
            mij = A[i,j] / ajj
            A[i,j] = 0.0
            A[i,j+1:n] -= mij * A[j,j+1:n]
            b[i] -= mij * bj
        end
    end
    return A, b
end

A = [3.0 1 2; -1 2 1; 1 1 4]
b = [6.0;2;6]
elim_gauss(A, b)
A