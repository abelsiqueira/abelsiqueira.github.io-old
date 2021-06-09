# This file was generated, do not modify it. # hide
x = range(0, stop=2*pi, length=100)
anim = Animation()
for i = 1:5:100
    plot(x[1:i], sin.(x[1:i]))
    frame(anim)
end
gif(anim, joinpath(@OUTPUT, "exemplo-1.gif"), fps=12) # hide