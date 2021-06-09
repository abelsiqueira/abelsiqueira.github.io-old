# This file was generated, do not modify it. # hide
function declu(A::Matrix; diagtol = 1e-12)
    n = size(A, 1)
    for j = 1:n-1
        ajj = A[j,j]
        if abs(ajj) <= diagtol
            error("Diagonal muito próxima de 0")
        end
        Lj = A[j,j+1:n]
        for i = j+1:n
            mij = A[i,j] / ajj
            A[i,j+1:n] = A[i,j+1:n] - mij * Lj
            A[i,j] = mij
        end
    end
    return tril(A,-1) + I, triu(A)
end

A = [3.0 1 2; -1 2 1; 1 1 4]
L, U = declu(copy(A))