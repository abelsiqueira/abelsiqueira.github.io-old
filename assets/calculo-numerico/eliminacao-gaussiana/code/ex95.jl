# This file was generated, do not modify it. # hide
function resolvelu(L, U, b)
    n = length(b)
    #Ly = b
    y = zeros(n)
    for i = 1:n
        s = 0.0
        for j = 1:i-1
            s += L[i,j] * y[j]
        end
        y[i] = b[i] - s
    end

    #Ux = y
    x = zeros(n)
    for i = n:-1:1
        s = 0.0
        for j = i+1:n
            s += U[i,j] * x[j]
        end
        x[i] = (y[i] - s) / U[i,i]
    end
    return x
end

A = [3.0 1 2; -1 2 1; 1 1 4]
b = A * ones(3)

L, U = declu(copy(A))
x = resolvelu(L, U, b)