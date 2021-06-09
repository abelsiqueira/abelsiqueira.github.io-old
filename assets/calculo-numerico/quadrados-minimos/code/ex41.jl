# This file was generated, do not modify it. # hide
scatter(x, y, leg=false)
#plot!(x, y_pred, c=:blue)
xlin = range(x[1], x[end], length=100)
ylin = α[1] .+ sum(α[j+1] * xlin.^j for j = 1:p)
plot!(xlin, ylin, c=:blue)
for i = 1:m
    plot!([x[i], x[i]], [y[i], y_pred[i]], c=:red, l=:dash)
end
title!("y_pred")
png(joinpath(@OUTPUT, "fig-quadmin24"))