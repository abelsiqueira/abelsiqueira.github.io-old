# This file was generated, do not modify it. # hide
function elim_gauss_pivot(A, b; diagtol = 1e-12)
    n = length(b)
    for j = 1:n-1
        pivo = 0.0
        k = j
        for i = j:n
            if abs(A[i,j]) > pivo
                pivo = abs(A[i,j])
                k = i
            end
        end
        if k != j
            A[ [j, k], :] = A[ [k, j], :]
            b[ [j, k] ]   = b[ [k, j] ]
        end
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

A = rand(4, 4)
b = A * ones(4)
elim_gauss_pivot(A, b)