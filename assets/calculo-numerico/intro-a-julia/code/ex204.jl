# This file was generated, do not modify it. # hide
x = range(0, stop=2*pi, length=100)
anim = Animation()
for i = 1:3:100
    plot(x, sin.(x), leg=false)
    a = x[i]
    scatter!([a], [sin(a)], c=:red)
    plot!(x, sin(a) .+ cos(a) * (x .- a) .- sin(a) * (x .- a).^2 / 2, c=:red, l=:dash)
    xlims!(x[1], x[end])
    ylims!(-2, 2)
    frame(anim)
end
gif(anim, joinpath(@OUTPUT, "exemplo-4.gif"), fps=12) # hide