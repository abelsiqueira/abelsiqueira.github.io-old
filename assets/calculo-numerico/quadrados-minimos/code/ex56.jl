# This file was generated, do not modify it. # hide
max_p = 15
erro_treino = []
erro_teste = []
for p = 1:max_p
    β = regressao_polinomial(x_tr, y_tr, p)
    xlin = range(0, 1, length=100)
    y_pred = [β[1] + sum(β[j + 1] * xi^j for j = 1:p) for xi = x]
    push!(erro_treino, 0.5 * norm(y_tr - y_pred[1:k])^2 / k)
    push!(erro_teste, 0.5 * norm(y_te - y_pred[k+1:end])^2 / (m - k))
end

scatter(1:max_p, erro_treino, c=:blue, leg=false, yaxis=:log)
plot!(1:max_p, erro_treino, c=:blue)
scatter!(1:max_p, erro_teste, c=:red)
plot!(1:max_p, erro_teste, c=:red)
png(joinpath(@OUTPUT, "fig-quadmin34"))