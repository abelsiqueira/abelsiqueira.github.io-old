# This file was generated, do not modify it. # hide
"""`regressao_linear(x, y)`
Calcule y ~ α + β x
"""
function regressao_linear(x, y)
    m = length(x)
    A = [ones(m)  x]
    sol = (A' * A) \ (A' * y)
    α, β = sol[1], sol[2]
    return α, β
end

"""
y ~ β₀ + β₁ x + … + βₚ xᵖ
"""
function regressao_polinomial(x, y, p)
    m = length(x)
    A = ones(m, p + 1)
    for i = 1:m
        for j = 2:p+1
            A[i,j] = x[i]^(j - 1)
        end
    end
    β = (A' * A) \ (A' * y)
    return β
end