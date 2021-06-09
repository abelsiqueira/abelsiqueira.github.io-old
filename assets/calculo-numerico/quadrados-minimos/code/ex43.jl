# This file was generated, do not modify it. # hide
y_nao_otimo = 1.9 .+ 0.6*x # Escolhido sabiamente

scatter(x, y, leg=false)
plot!(x, y_nao_otimo, c=:blue)
for i = 1:m
    plot!([x[i], x[i]], [y[i], y_nao_otimo[i]], c=:red, l=:dash)
end
title!("y_nao_otimo")
png(joinpath(@OUTPUT, "fig-quadmin25"))