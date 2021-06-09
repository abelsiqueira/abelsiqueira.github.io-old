# This file was generated, do not modify it. # hide
u0(x, y) = exp(-((x - y^2)^2 + x^2))
X = -1.5:0.1:2.5
Y = -2:0.1:2
S = sum(u0.(X, Y)) * (X[2] - X[1]) * (Y[2] - Y[1])
u(t,x,y) = exp(-t) * (t * S + u0(x,y) * (1 - t))

t = 0:0.02:1
anim = Animation()
for ti = t
    layout = grid(2, 2)
    plt = plot(layout = layout)
    contour!(plt[1], X, Y, (x,y) -> u(ti,x,y))
    surface!(plt[2], X, Y, (x,y) -> u(ti,x,y))
    wireframe!(plt[3], X, Y, (x,y) -> u(ti,x,y))
    surface!(plt[4], X, Y, (x,y) -> u(ti,x,y), camera=(60, 60))
    zlims!(0, 1)
    frame(anim)
end
gif(anim, joinpath(@OUTPUT, "exemplo-5.gif"), fps=12) # hide