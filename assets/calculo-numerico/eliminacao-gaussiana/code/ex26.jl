# This file was generated, do not modify it. # hide
function elim_gauss(A, b; diagtol = 1e-12)
    n = size(A, 1)
    for j = 1:n-1
        if abs(A[j,j]) < diagtol
            error("Diagonal quase nula")
        end
        for i = j+1:n
            mij = A[i,j] / A[j,j]
            A[i,1:j] .= 0.0
            A[i,j+1:n] -= mij * A[j,j+1:n]
            b[i] -= mij * b[j]
        end
    end
    return A, b
end

A = [3.0 1 2; -1 2 1; 1 1 4]
b = [6.0; 2; 6]
elim_gauss(A, b)