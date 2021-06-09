# This file was generated, do not modify it. # hide
f(x,y) = x^2 + 4y^2
X = -1:0.05:1
Y = -1:0.05:1
layout = grid(2, 2)
plt = plot(layout = layout)
contour!(plt[1], X, Y, f)
surface!(plt[2], X, Y, f)
wireframe!(plt[3], X, Y, f)
surface!(plt[4], X, Y, f, camera=(60, 60))
png(joinpath(@OUTPUT, "plt-3d1")) # hide