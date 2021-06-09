# This file was generated, do not modify it. # hide
function declupivot(A::Matrix; diagtol = 1e-12)
    n = size(A, 2)
    p = collect(1:n)
    for j = 1:n-1
        #Quem é o pivô
        pivo, k = abs(A[j,j]), j
        for i = j+1:n
            if abs(A[i,j]) > pivo
                pivo, k = abs(A[i,j]), i
            end
        end
        if pivo <= diagtol
            error("Matriz singular ou muito próxima de ser singular")
        end

        if k != j
            p[k], p[j] = p[j], p[k]
            A[[k;j],:] = A[[j;k],:]
        end
        ajj = A[j,j]
        for i = j+1:n
            mij = A[i,j] / ajj
            A[i,j] = mij
            A[i,j+1:n] -= mij * A[j,j+1:n]
        end
    end
    return p
end

A = [ 1  3  0  1;
      2  1  1  1;
     -3 -1 -1 -3;
     -1 -1  0 -1.0]
p = declupivot(A)
A