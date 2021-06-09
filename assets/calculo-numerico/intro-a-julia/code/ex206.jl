# This file was generated, do not modify it. # hide
f(x,y) = (y - 0.5) / (x^2 + 1)
layout = grid(2, 2)
plt = plot(layout = layout)
contour!(plt[1], X, Y, f)
surface!(plt[2], X, Y, f)
wireframe!(plt[3], X, Y, f)
surface!(plt[4], X, Y, f, camera=(60, 60))
png(joinpath(@OUTPUT, "plt-3d2")) # hide