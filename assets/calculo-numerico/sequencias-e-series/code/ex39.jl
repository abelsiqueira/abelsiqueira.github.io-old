# This file was generated, do not modify it. # hide
x = 10.0
n = 60
E = [1.0]
t = 1.0
for k = 1:n
    global t # hide
    t = t * x / k
    push!(E, t)
end
scatter(E, yaxis=:log)
png(joinpath(@OUTPUT, "plt-exp3")) # hide