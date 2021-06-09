# This file was generated, do not modify it. # hide
x = range(0, stop=2*pi, length=100)
anim = Animation()
for i = 1:3:100
    plot(x[1:i], sin.(x[1:i]))
    xlims!(x[1], x[end])
    ylims!(-1, 1)
    frame(anim)
end
gif(anim, joinpath(@OUTPUT, "exemplo-2.gif"), fps=12) # hide