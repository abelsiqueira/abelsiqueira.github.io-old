# This file was generated, do not modify it. # hide
Random.seed!(0)
I = randperm(m)
x, y = x[I], y[I]
k = round(Int, 0.6m)
x_tr, y_tr, x_te, y_te = x[1:k], y[1:k], x[k+1:end], y[k+1:end]

p = 6
β = regressao_polinomial(x_tr, y_tr, p) # Apenas o conjunto de treino é usado
y_pred = [β[1] + sum(β[j + 1] * xi^j for j = 1:p) for xi = x_te]
erro = 0.5 * norm(y_te - y_pred)^2