# This file was generated, do not modify it. # hide
function regressao_polinomial(x, y, p)
    m = length(x)
    A = [ones(m) [x[i]^j for i = 1:m, j = 1:p]]
    #β = (A' * A) \ (A' * y)
    β = A \ y
    return β
end

Random.seed!(0)
m = 10
x = sort(rand(m))
#x = collect(range(-1, 1, length=m))
y = 3x .+ 5 + randn(m) * 0.25
scatter(x, y, leg=false)
png(joinpath(@OUTPUT, "fig-quadmin27"))