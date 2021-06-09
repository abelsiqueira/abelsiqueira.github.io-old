# This file was generated, do not modify it. # hide
plot(sin, 0, 2pi, label="sin")
plot!(cos, 0, 2pi, label="cos", c = :magenta)
plot!(x->1, 0, 2pi, c=:red, l=:dash, label="")
plot!(x->-1, 0, 2pi, c=:red, l=:dash, label="")
xlabel!("x in [0,2pi]")
ylabel!("sin, cos")
title!("Funções seno e cosseno")
ylims!(-1.2, 1.2)
xticks!(0:pi/2:2pi, ["0", "\\pi /2", "\\pi", "3\\pi/2", "2\\pi"])
png(joinpath(@OUTPUT, "plt-ex8")) # hide