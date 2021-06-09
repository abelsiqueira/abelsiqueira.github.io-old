# This file was generated, do not modify it. # hide
y_med = mean(y)
y_pred = [β[1] .+ sum(β[j + 1] * x[i].^j for j = 1:p) for i = 1:m]
ST = norm(y .- y_med)^2
Sr_pred = norm(y - y_pred)^2
R2_pred = 1 - Sr_pred / ST